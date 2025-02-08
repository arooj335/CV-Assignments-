import cv2
import numpy as np

# Web cam
cap = cv2.VideoCapture('video.mp4')



count_line_position = 550
min_width_react = 80
min_height_react = 80

# Initialize subtractor
algo = cv2.bgsegm.createBackgroundSubtractorMOG()

def center_handle(x, y, w, h):
    x1 = int(w / 2)
    y1 = int(h / 2)
    cx = x + x1
    cy = y + y1
    return cx, cy

detect = []
offset = 6
counter = 0

while True:
    ret, frame1 = cap.read()

    if not ret:
        print("Error: Failed to capture frame.")
        break  # Exit the loop if no frame is read

    grey = cv2.cvtColor(frame1, cv2.COLOR_RGB2GRAY)
    blur = cv2.GaussianBlur(grey, (3, 3), 5)

    # Applying on each frame
    img_sub = algo.apply(blur)
    dilat = cv2.dilate(img_sub, np.ones((5, 5)))

    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (2, 2))
    dilatada = cv2.morphologyEx(dilat, cv2.MORPH_CLOSE, kernel)
    dilatada = cv2.morphologyEx(dilatada, cv2.MORPH_CLOSE, kernel)

    countershape, h = cv2.findContours(dilatada, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    cv2.line(frame1, (25, count_line_position), (1200, count_line_position), (255, 127, 0), 3)

    for (i, c) in enumerate(countershape):
        (x, y, w, h) = cv2.boundingRect(c)
        validate_counter = (w >= min_width_react) and (h >= min_height_react)
        if not validate_counter:
            continue

        cv2.rectangle(frame1, (x, y), (x + w, y + h), (0, 255, 0), 2)

        center = center_handle(x, y, w, h)
        detect.append(center)
        cv2.circle(frame1, center, 4, (0, 0, 255), -1)

        for (x, y) in detect:
            if count_line_position - offset < y < count_line_position + offset:
                counter += 1
                print("Vehicle Counter: " + str(counter))
                detect.remove((x, y))  # Remove the center after counting

    cv2.putText(frame1, "Vehicle Counter: " + str(counter), (450, 70), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 5)

    # Show the processed frame
    cv2.imshow('Original with contours', frame1)

    # Slow down playback speed (adjust delay as needed)
    if cv2.waitKey(1) == 13:  # If Enter key is pressed, break the loop
        break

# Cleanup
cv2.destroyAllWindows()
cap.release()
