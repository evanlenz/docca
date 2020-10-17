echo "Deleting any previous qbk and images directories..."
rm -rf qbk images

echo "Copying main.qbk from ../example..."
cp -r ../example/main.qbk .

echo "Copying qbk from ../example/qbk..."
cp -r ../example/qbk .

echo "Copying images (if any) from ../example/images"
cp -r ../example/images . 2>/dev/null
