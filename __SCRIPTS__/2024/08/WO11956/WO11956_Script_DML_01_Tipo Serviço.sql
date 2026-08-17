---------------------------------------------------------------------------------
--N. SIG..........: WO11956
--Data............: 07/08/2024
--Responsável.....: Paulo Nobre
--Descrição.......: Incluso mais um Tipo de Serviço - "Corretora"
---------------------------------------------------------------------------------
INSERT INTO CM.TIPO_SERVICO (ID_TIPO_SERVICO, DS_TIPO_SERVICO) VALUES ((SELECT MAX(ID_TIPO_SERVICO) + 1 FROM CM.TIPO_SERVICO),'Corretora'); 