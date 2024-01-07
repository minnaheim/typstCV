scp typst/cv.pdf ben-docker-1:benarmstro.ng/
ssh ben-docker-1 "cd benarmstro.ng/ && sudo mv cv.pdf cv/cv.pdf"
cp typst/cv.pdf html/cv.pdf
