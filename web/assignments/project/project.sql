-- Schema project

DROP SCHEMA project CASCADE;


-- Schema project

CREATE SCHEMA project;

-- Table project.user

CREATE TABLE project.user (
  id SERIAL,
  username VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
  );

INSERT INTO project.user (username,password)
VALUES ('admin','admin');

-- Table project.school

CREATE TABLE project.school (
  id SERIAL,
  school VARCHAR(45) NOT NULL,
  email VARCHAR(45) NULL,
  website VARCHAR(45) NULL,
  logo VARCHAR(45) NULL,
  PRIMARY KEY (id)
  );

INSERT INTO project.school (school, email, website)
VALUES
	('Eurocentres','contact@eurocentres.com','www.eurocentres.com'),
	('ELS','info@els.edu','www.els.edu'),
	('Linguaviva','info@linguaviva.it','www.linguaviva.it'),
	('The Language Company (TLC)','info@thelanguagecompany.com','www.thelanguagecompany.com'),
	('Language Studies International (LSI)','','www.lsi.edu')
;


-- Table project.center

CREATE TABLE project.center (
  id SERIAL,
  center VARCHAR(45) NOT NULL,
  address VARCHAR(145) NULL,
  email VARCHAR(45) NULL,
  phone VARCHAR(45) NULL,
  city VARCHAR(45) NOT NULL,
  country VARCHAR(45) NOT NULL,
  school_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_center_school
    FOREIGN KEY (school_id)
    REFERENCES project.school (id)
  );

INSERT INTO project.center (center, address, email, phone, city, country, school_id)
VALUES
('Amboise','9 mail Saint- Thomas','amb-info@eurocentres.com','33247231060','Amboise','France','1'),
('Berlín','Bernburger Str. 30-31','ver-info@eurocentres.com','4903026394999','Berlin','Germany','1'),
('Boston - NESE','36 John F. Kennedy St','','-6178647170','Cambridge','USA','1'),
('Bournemouth','26 Dean Park Road','bth-info@eurocentres.com','441202554426','Bournemouth','United Kingdom','1'),
('Brighton','20 North Street','bri-info@eurocentres.com','441273324545','Brighton','United Kingdom','1'),
('Cairns','91-97 Mulgrave Road','cns-info@eurocentres.com','61740548691','Cairns','Canada','1'),
('Cambridge','57 Bateman Street','cam-info@eurocentres.com','441223353607','Cambridge','United Kingdom','1'),
('Ciudad del Cabo','50-on-Long/ 50 Long St. 1st Floor','cap-info@eurocentres.com','27214231833','Cape Town','Australia','1'),
('Dublin','4 North Great Georges St','admin@alphacollege.com','35318747024','Dublin','United Kingdom','1'),
('East Lansing','English Language Center Michigan State University','elc@msu.edu','15173530800','East Lansing','United States','1'),
('Florencia','Palazzo Guadagni ','fir-info@eurocentres.com','39055213030','Florencia','Italy','1'),
('Kanazawa','1-5-3 Hon-machi','kan-info@eurocentres.com','81762601543','Kanazawa','Japan','1'),
('La Rochelle','Avenue Michel Crépeau','lar-info@eurocentres.com','33546505733','La Rochelle','France','1'),
('Lausana','Rue de Genevé 35','lsn-info@eurocentres.com','41213187130','Lausana','Switzerland','1'),
('Londres Central','56 Eccleston Square','vic-info@eurocentres.com','442078344155','Londres Central','United Kingdom','1'),
('Londres Eltham','','','','','United Kingdom','1'),
('Londres Lee Green','21 Meadowcourt Road','lee-info@eurocentres.com','442083185633','Londres Lee Green','United Kingdom','1'),
('Melbourne','','','','','Canada','1'),
('Moscú','Liden & Denz Language Centre Moscow','moscow@lidenz.ru','74952544991','Moscú','Russia','1'),
('Nueva York','American Language Program Room 504','alp@columbia.edu','12128543584','Nueva York','United States','1'),
('París','13 passage Dauphine','par-info@eurocentres.com','330140467200','Paris','France','1'),
('Pekin','Ping An Fu Hotel','bei-info@eurocentres.com','8613520103215','Pekin','China','1'),
('San Diego','','','','','United States','1'),
('San Petersburgo','Liden & Denz Language Centre St. Petersburg','bookings@lidenz.ru','78123340788','San Petersburgo','Russia','1'),
('Sliema','12 Taliana Lane','','35625588500','Sliema','South Africa','1'),
('Sydney','128 Chalmers Street','syd_info@eurocentres.com','61296994588','Sydney','Canada','1'),
('Toronto','#220-111 Peter Street','tor-info@eurocentres.com','14165421626','Toronto','Ireland','1'),
('Vancouver','#250-815 West Hastings Street','van-info@eurocentres.com','16046887942','Vancouver','Ireland','1'),
('Atlanta','1100 South Marietta Parkway','','-6789154960','Marietta','USA','2'),
('Berkeley','2425 Prospect Street','','-5108450201','Berkeley','USA','2'),
('Boston Downtown','125 Tremont Street','','-6175744820','Boston','USA','2'),
('Boston-Newton','777 Dedham Street','','6172444448','Newton','USA','2'),
('Bristol','1 Old Ferry Road','','-4012545300','Bristol','USA','2'),
('Charlotte','5200 Park Road','','-7045274172','Charlotte','USA','2'),
('Chicago','7200 West Division Street','','-7084885010','River Forest','USA','2'),
('Chicago-Romeoville','1 University Parkway','','','Romeoville','USA','2'),
('Cincinnati','60 West Charlton Street','','-5135564034','Cincinnati','USA','2'),
('Clemson Greenville','225 South Pleasantburg Drive','','-8642335993','Greenville','USA','2'),
('Cleveland','11321 Juniper Rd','','-2163682716','Cleveland','USA','2'),
('Columbus','1216 Sunbury Rd','','6142517360','Columbus','USA','2'),
('Dallas','800 West Campbell Road','','9722344611','Richardson','USA','2'),
('DeKalb','385 Wirtz Drive','','8157534600','DeKalb','USA','2'),
('Denver','3645 West 112th Ave','','-3034045717','Westminster','USA','2'),
('Fort Wayne','2101 E Coliseum Blvd','','2604810357','Fort Wayne','USA','2'),
('Fredericksburg','1125 Jefferson Davis','','5403712039','Fredericksburg','USA','2'),
('Garden City','1 South Avenue','','-5168773910','Garden City','USA','2'),
('Grand Forks','221 Centennial Dr.','','-7017776785','Grand Forks','USA','2'),
('Grand Rapids','1150 Au Sable Hall','','-6163319222','Allendale','USA','2'),
('Honolulu','1188 Fort Street','hnl@els.edu','-8085438075','Honolulu','USA','2'),
('Houston','4200 Montrose Blvd','','-7135212030','Houston','USA','2'),
('Houston-Clear Lake','2700 Bay Area Blvd','','2812833034','Houston','USA','2'),
('Indianapolis','151 West Ohio Street','','-3172742371','Indianapolis','USA','2'),
('Johnson City','503 South Dossett Drive','','-4234397147','Johnson City','USA','2'),
('La Verne','1886 Third Street','','-9095935555','La Verne','USA','2'),
('Lubbock','1921 Broadway Street','','8067475340','Lubbock','USA','2'),
('Manhattan','75 Varick Street','','-2124319330','New York','USA','2'),
('Melbourne','150 West University Boulevard','','-3217273990','Melbourne','USA','2'),
('Miami','11300 NE Second Avenue','','-3058993390','Miami Shores','USA','2'),
('Milwaukee','1834 W Wisconsin Ave','','4143449325','Milwaukee','USA','2'),
('Nashville','820 Fairview Avenue','','-6158982980','Murfreesboro','USA','2'),
('New Haven ','1211 Campbell Avenue,','','-2039312970','West Haven','USA','2'),
('Oklahoma City','1915 N.W. 24th Street','','-4055253738','Oklahoma City','USA','2'),
('Orlando','800 Celebration Avenue','','-3219392444','Celebration','USA','2'),
('Philadelphia','5414 Overbrook Avenue','','-2154734430','Philadelphia','USA','2'),
('Pittsburgh','201 Wood Street Lawrence Hall, Room 804','','-4123923802','Pittsburgh','USA','2'),
('Portland','2811 NE Holman St.','','-5032808552','Portland','USA','2'),
('Riverdale','6301 Riverdale Ave.','','-7187966325','Riverdale','USA','2'),
('Rochester','350 New Campus Drive','','5853957500','Brockport','USA','2'),
('Ruston','305 Wisteria St.','','-3182572012','Ruston','USA','2'),
('San Antonio','4301 Broadway','','-2102835077','San Antonio','USA','2'),
('San Diego','110 West C Street','','-6195570136','San Diego','USA','2'),
('San Francisco-Dowtown ','300 Montgomery Street, Suite 200','','-4157965356','San Francisco','USA','2'),
('San Francisco-North Bay ','190 Palm Avenue','','-4154853224','San Rafael','USA','2'),
('Santa Barbara','104 West Anapamu, Suite I','','-8059660172','Santa Barbara','USA','2'),
('Santa Cruz','','','','','USA','2'),
('Santa Monica','1413 Second Street','','-3104514544','Santa Monica','USA','2'),
('Seattle','400 East Pine Street','','-2066231481','Seattle','USA','2'),
('Silicon Valley ','21269 Stevens Creek Blvd','','4088651164','Cupertino','USA','2'),
('St. Louis','1 University Dr','','-3145164621','St. Louis','USA','2'),
('St. Paul','2115 Summit Avenue','','-6519625990','St. Paul','USA','2'),
('St. Petersburg','4200 54th Avenue South','','-7278647820','St. Petersburg','USA','2'),
('Tacoma','1101 South Yakima Ave','','2536807284','Tacoma','USA','2'),
('Tampa','701 W Kennedy Blvd','','8132576328','Tampa','USA','2'),
('Teaneck','1000 River Road, Robison Hall','','-2019070004','Teaneck','USA','2'),
('Thousand Oaks','203 Faculty Street','','-8054933760','Thousand Oaks','USA','2'),
('Vancouver','','','','','Canada','2'),
('Washington','4000 Chesapeake St NW','','-2022430138','Washington','USA','2'),
('Florencia','Via Fiume 17 50123','info@linguaviva.it','-39055294359','Firenze','Italy','3'),
('Milan','Corso Buenos Aires 43 20124','info@linguadue.com','-390229519972','Milan','Italy','3'),
('Ada','East Central University, 1100 E. 14th Street, PMB Y-3','tlcada@thelanguagecompany.com','-5805595945','Ada','USA','4'),
('Berkeley','2470 Telegraph Avenue, Suite 200','tlcberkeley@thelanguagecompany.com','-5108488110','Berkeley','USA','4'),
('Boston','Bay State College, 122 Commonwealth Avenue','tlcboston@thelanguagecompany.com','-6176073240','Boston','USA','4'),
('Bowling Green','Bowling Green State University, Moseley Hall, Room 404A','tlcbowlinggreen@thelanguagecompany.com','-4193729114','Bowling Green','USA','4'),
('Dallas/Fort Worth','Texas Wesleyan University, 1201 Wesleyan Street','tlcdfw@thelanguagecompany.com','-8175312991','Dallas/Fort Wort','USA','4'),
('Edmond','University of Central Oklahoma, 100 N. University Drive, P.M.B. 341881','tlcedmond@thelanguagecompany.com','-4053412125',' Edmond','USA','4'),
('Fairfax','2810 Old Lee Highway, #100','tlcfairfax@thelanguagecompany.com','-7035601568','Fairfax','USA','4'),
('Fort Wayne','3800 N. Anthony Blvd.','tlc-fortwayne@ivytech.edu','-2604804141','Fort Wayne','USA','4'),
('Frostburg','Frostburg State University, 101 Braddock Road','tlcfrostburg@thelanguagecompany.com','-3016871097','Frostburg','USA','4'),
('Kirksville','Truman State University, Kirk Building 215, 100 E. Normal avenue','tlckirksville@thelanguagecompany.com','-6606276001','Kirksville','USA','4'),
('Minot','Minot State University, Dakota Hall, 500 University Ave. West','tlcminot@thelanguagecompany.com','-7018584561','Minot','USA','4'),
('Orlando','Florida Mall Business Center, 1650 Sand Lake Rd., Suite 100','tlcorlando@thelanguagecompany.com','-4078595444','Orlando','USA','4'),
('Philadelphia','111 S. Independence Mall East Suite 840','tlcphilly@thelanguagecompany.com','-2678869399','Philadelphia','USA','4'),
('South Bend','Indiana University South Bend, 1700 Mishawaka Avenue, Suite 001','tlcsouthbend@thelanguagecompany.com','-5742873622','South Bend','USA','4'),
('Auckland','Level 1 10-12 Scotia Place','auc@LSI.edu','64093033097','Auckland','New Zealand','5'),
('Berkeley','2015 Center Street','ber@LSI.edu','15108414695','Berkeley','USA','5'),
('Boston','105 Beach Street','bos@LSI.edu','16175423600','Boston','USA','5'),
('Brighton','13 Ventnor Villas','bri@LSI.edu','4401273722060','Brighton','UK','5'),
('Brisbane','93 Edward Street','bne@LSI.edu','610732216977','Brisbane','Australia','5'),
('Cambridge','41 Tenison Road','cam@LSI.edu','4401223361783','Cambridge CB1 2DG','UK','5'),
('London Central','19-21 Ridgmount Street','lon@LSI.edu','4402074676500','London WC1E 7AH','UK','5'),
('London Hampstead','13 Lyndhurst Terrace','ham@LSI.edu','4402077948111','London NW3 5QA','UK','5'),
('New York','431 Canal Street 12th Floor','nyc@LSI.edu','12129659940','New York','USA','5'),
('Paris','350 Rue St Honoré','par@LSI.edu','330142605370','Paris','France','5'),
('San Diego','1706 5th Avenue','info-san@lsi.edu','16192342881','San Diego','USA','5'),
('Toronto','1055 Yonge St 210','tor@LSI.edu','14169286888','Toronto ON M4W 2L2','','5'),
('Vancouver','101 808 Nelson Street','van@LSI.edu','16046837654','Vancouver B.C. V6Z 2H2','Canada','5'),
('Zurich','Kreuzstrasse 36','zur@LSI.edu','410442515889','Zurich','Switzerland','5')
;


-- Table project.program

CREATE TABLE project.program (
  id SERIAL,
  program VARCHAR(245) NOT NULL,
  description VARCHAR(245) NOT NULL,
  language VARCHAR(145) NOT NULL,
  currency VARCHAR(3) NOT NULL,
  cost INT NOT NULL,
  weeks INT NOT NULL,
  lessons VARCHAR(45),
  center_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_program_center1
    FOREIGN KEY (center_id)
    REFERENCES project.center (id)
  );

INSERT INTO project.program (program, description, language, currency, cost, weeks, lessons, center_id)
VALUES
('Standard','','Italiano','EUR','380','2','20','88'),
('Standard','','Italiano','EUR','570','3','20','88'),
('Standard','','Italiano','EUR','760','4','20','88'),
('Standard','Semana Adicional','Italiano','EUR','190','1','20','88'),
('Long Term Standard','','Italiano','EUR','2040','12','20','88'),
('Long Term Standard','Semana Adicional','Italiano','EUR','170','1','20','88'),
('Long Term Standard','','Italiano','EUR','3840','24','20','88'),
('Long Term Standard','Semana Adicional','Italiano','EUR','160','1','20','88'),
('Intensive','','Italiano','EUR','580','2','30','88'),
('Intensive','','Italiano','EUR','870','3','30','88'),
('Intensive','','Italiano','EUR','1160','4','30','88'),
('Intensive','Semana Adicional','Italiano','EUR','290','1','30','88'),
('Super Intensive','','Italiano','EUR','1300','2','30','88'),
('Super Intensive','','Italiano','EUR','1950','3','30','88'),
('Super Intensive','','Italiano','EUR','2600','4','30','88'),
('Super Intensive','Semana Adicional','Italiano','EUR','650','1','30','88'),
('Italian + Cooking','','Italiano','EUR','780','2','26','88'),
('Italian + Cooking','','Italiano','EUR','1070','3','26','88'),
('Italian + Cooking','','Italiano','EUR','1350','4','26','88'),
('Art History','Art History','Italiano','EUR','185','2','7','88'),
('Italian + Arts','Interior Design','Italiano','EUR','1400','4','28','88'),
('Italian + Arts','Interior Design','Italiano','EUR','5250','16','32','88'),
('Italian + Arts','Fashion','Italiano','EUR','1400','4','28','88'),
('Italian + Arts','Fashion','Italiano','EUR','5250','16','32','88'),
('Italian + Arts','Photography','Italiano','EUR','1400','4','28','88'),
('Italian + Arts','Photography','Italiano','EUR','5250','16','32','88'),
('Italian + Arts','Painting','Italiano','EUR','1400','4','28','88'),
('Italian + Arts','Painting','Italiano','EUR','5250','16','32','88'),
('One to One','Standard','Italiano','EUR','920','1','20','88'),
('One to One','Intensive','Italiano','EUR','1380','1','30','88'),
('One to One','Super Intensive','Italiano','EUR','1840','1','40','88'),
('Cultural Programme for Seniors','','Italiano','EUR','980','2','18','88'),
('Individual prepatory for CILS','','Italiano','EUR','460','1','10','88'),
('Preparatory for Italian University','','Italiano','EUR','2450','9','250','88'),
('Internship Programme','','Italiano','EUR','900','8','','88'),
('Internship Programme','','Italiano','EUR','1110','12','','88'),
('Internship Programme','','Italiano','EUR','1320','16','','88'),
('Standard','','Italiano','EUR','380','2','20','89'),
('Standard','','Italiano','EUR','570','3','20','89'),
('Standard','','Italiano','EUR','760','4','20','89'),
('Standard','Semana Adicional','Italiano','EUR','190','1','20','89'),
('Long Term Standard','','Italiano','EUR','2040','12','20','89'),
('Long Term Standard','Semana Adicional','Italiano','EUR','170','1','20','89'),
('Long Term Standard','','Italiano','EUR','3840','24','20','89'),
('Long Term Standard','Semana Adicional','Italiano','EUR','160','1','20','89'),
('Intensive','','Italiano','EUR','580','2','30','89'),
('Intensive','','Italiano','EUR','870','3','30','89'),
('Intensive','Intensive','Italiano','EUR','1160','4','30','89'),
('Intensive','Semana Adicional','Italiano','EUR','290','1','30','89'),
('Super Intensive','','Italiano','EUR','1300','2','30','89'),
('Super Intensive','','Italiano','EUR','1950','3','30','89'),
('Super Intensive','','Italiano','EUR','2600','4','30','89'),
('Super Intensive','Semana Adicional','Italiano','EUR','650','1','30','89'),
('Evening Courses','','Italiano','EUR','450','12','48','89'),
('Summer Programmes','Italian + Fashion Design','Italiano','EUR','1400','4','28','89'),
('Summer Programmes','Italian + Interior Design ','Italiano','EUR','1400','4','28','89'),
('One to One','Standard','Italiano','EUR','920','1','20','89'),
('One to One','Intensive','Italiano','EUR','1380','1','30','89'),
('One to One','Super Intensive','Italiano','EUR','1840','1','40','89'),
('Individual prepatory for CILS','','Italiano','EUR','460','1','10','89'),
('Preparatory for Italian University','','Italiano','EUR','2450','9','250','89'),
('Preparatory for Italian University','','Italiano','EUR','1280','4','120','89'),
('Preparatory for Fashion & Design Schools','','Italiano','EUR','1230','6','120','89'),
('Internship Programme','','Italiano','EUR','900','8','0','89'),
('Internship Programme','','Italiano','EUR','1110','12','0','89'),
('Internship Programme','','Italiano','EUR','1320','16','0','89')
;
-- Table project.agent

CREATE TABLE project.agent (
  id SERIAL,
  agent VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  name VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (id));



-- Table project.quotation

CREATE TABLE project.quotation (
  id SERIAL,
  dateCreated DATE NULL,
  dateExpired DATE NULL,
  currencyExchange INT NOT NULL,
  program_id INT NOT NULL,
  agent_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_quotation_program1
    FOREIGN KEY (program_id)
    REFERENCES project.program (id),
  CONSTRAINT fk_quotation_agent1
    FOREIGN KEY (agent_id)
    REFERENCES project.agent (id)
  );



-- Table project.contact

CREATE TABLE project.contact (
  id SERIAL,
  firstName VARCHAR(45) NOT NULL,
  lastName VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  phone VARCHAR(45) NULL,
  quotation_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_contact_quotation1
    FOREIGN KEY (quotation_id)
    REFERENCES project.quotation (id)
  );


