require "google_drive"
require "pry"
require "gmail"



session = GoogleDrive::Session.from_config("config.json")

ws = session.spreadsheet_by_key("1_gGRimd3J3Mg0VwjnIA8b-K_SDkxkqJDIOQ9F0SVCho").worksheets[0]

email = ws[181, 2]


#def envoyer_UN_mail(email, nom)


	gmail = Gmail.connect('test.thehackingproject@gmail.com', 'thehackingproject75')

	gmail.deliver do
		
	  to email
	  subject "Connaissez-vous The Hacking Project ?"
	  text_part do
	    body "Bonjour,
	Je m'appelle Maxime, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

	Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{nom}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{nom} !

	Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"

	gmail.logout
	
  	  end

	end	

	
#end

=begin

def envoyer_plrs_mail(ws)

	x = 0
	email = ws[x+1, 2]
	nom = ws[x+1, 1]

	email.each do |i|  
	envoyer_UN_mail(email, nom)

	end
end

=end













=begin

def get_worksheet(key) # Connection à Google Sheet

	session = connect_to_drive

	worksheet = session.spreadsheet_by_key(key).worksheets[0]

	return worksheet
end

def get_data # Connection au fichier Google Sheet

	key = "1_gGRimd3J3Mg0VwjnIA8b-K_SDkxkqJDIOQ9F0SVCho"

	worksheet = get_worksheet(key)


	email = worksheet[181, 2]
	nom = worksheet[181, 1]

	return email, nom
end


def send_mail # Envoi du mail

data = get_data

gmail = Gmail.connect('test.thehackingproject@gmail.com', 'thehackingproject75')


gmail.deliver do
	
  to data[0]
  subject "Connaissez-vous The Hacking Project ?"
  text_part do
    body "Bonjour,
Je m'appelle Maxime, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{$nom}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{nom} !

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"

gmail.logout

  end
end


send_mail

end

=end