from PIL import Image
import os

# Nouveau nom de l'image source et du fichier COE
image_source = 'mario.jpg'
coe_file = 'mario.coe'

# Dimensions de l'image
MAX_PIXELS = 307200  # 640x480

# Chemin complet du répertoire de travail
dir_path = os.path.dirname(os.path.abspath(__file__))

# Construction du chemin complet pour l'image source
image_source = os.path.join(dir_path, image_source)

# Ouvrir l'image
im = Image.open(image_source)
im = im.convert('RGB')

# Dimensions de l'image
L, H = im.size

# Limiter le nombre de pixels
num_pixels = min(MAX_PIXELS, L * H)
if L * H > MAX_PIXELS:
    print("La taille de l'image dépasse la taille de l'écran VGA\n")

# Création d'une liste vide pour les données
coe_data = []

# Parcours de l'image et conversion des pixels
with open(coe_file, 'w') as fp:
    fp.write("CONSTANT data_vector : data_Array := (\n")
    for y in range(H-1, -1, -1):  # Parcours des lignes à l'envers
        for x in range(L-1, -1, -1):  # Parcours des colonnes à l'envers
            if len(coe_data) >= num_pixels:
                break
            r, g, b = im.getpixel((x, y))  # Récupération du pixel à l'envers
            # Convertir la couleur en 4 bits par composante (RVB)
            r = min(r // 16, 15)  # Limiter la valeur à 4 bits
            g = min(g // 16, 15)
            b = min(b // 16, 15)
            # Combinaison des composantes en un nombre binaire de 12 bits
            color_pixel = '{:04b}{:04b}{:04b}'.format(r, g, b)
            fp.write('\t"' + color_pixel + '",\n')
            coe_data.append(color_pixel)
    fp.write('\t"111111111111");\n')
    fp.write("-- Le nombre de vecteur : " + str(len(coe_data)) + "\n")
