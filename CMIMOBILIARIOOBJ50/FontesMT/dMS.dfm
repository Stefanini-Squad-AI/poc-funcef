object dtmMS: TdtmMS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 392
  Top = 210
  Height = 710
  Width = 936
  object MS_AdminImovel: TMontaSelect
    Template.IdConsulta = 131
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMDOCUMENTO'
      'P.NOME'
      'P.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'ADMINIMOVEL A')
    CamposChave.Strings = (
      'A.IDADMINIMOVEL'
      'P.NOME'
      'P.RAZAOSOCIAL')
    Filtro.Strings = (
      'A.IDADMINIMOVEL = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 120
    Top = 40
  end
  object MS_Bem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'B.BAIXATOTAL'
      'B.DESBEM'
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'B.PLACA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Baixado'
      'Descrição do Bem'
      'Imóvel Mestre'
      'Imóvel'
      'Código do Imóvel'
      'Placa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM B'
      'CONJUNTO C'
      'LOCALIZACAO L'
      'GRUPO G'
      'IMOVEL I'
      'IMOVEL IM'
      'IMOVELXBEM IXB')
    CamposChave.Strings = (
      'B.IDBEM'
      'B.PLACA'
      'B.DESBEM'
      'B.IDCONJUNTO'
      'C.DESCCONJUNTO'
      'B.IDGRUPO'
      'G.NOME'
      'C.IDLOCALIZACAO'
      'L.NOME'
      'B.IDPESSOA')
    Filtro.Strings = (
      'B.IDCONJUNTO = C.IDCONJUNTO (+)'
      'C.IDLOCALIZACAO = L.IDLOCALIZACAO (+)'
      'B.IDGRUPO = G.IDGRUPO(+)'
      'B.IDBEM = IXB.IDBEM'
      'IXB.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '1'
      '200'
      '60'
      '60'
      '15'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 120
    Top = 88
  end
  object MS_Cartorio: TMontaSelect
    Template.IdConsulta = 105
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMDOCUMENTO'
      'P.NOME'
      'P.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'CARTORIO C')
    CamposChave.Strings = (
      'C.IDCARTORIO'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'C.IDCARTORIO = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 120
    Top = 184
  end
  object MS_CContabil: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLAREDUZ')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLASUBCONTA'
      'PLANOCONTA.PLACCUST')
    Filtro.Strings = (
      'PLANOCONTA.PLATIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 120
    Top = 232
  end
  object MS_Cliente: TMontaSelect
    Template.IdConsulta = 107
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMDOCUMENTO'
      'P.NOME'
      'P.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'EMPRESACLIENTE E')
    CamposChave.Strings = (
      'E.IDFORCLI'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'E.IDFORCLI = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 120
    Top = 280
  end
  object MS_Contrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'SUSPENSO'#39', '#39'R'#39', '#39'RESCINDIDO'#39', '#39'V'#39', '#39'VI' +
        'GENTE'#39', '#39'ENCERRADO'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'U.NOMEUSUARIO'
      'PR.NOME'
      'TC.IDTIPOCONTRIMOB')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'L')
    Descricao.Strings = (
      'Nº do Contrato'
      'Nome do Contrato'
      'Status'
      'CPF/CNPJ Locatário'
      'Nome do Locatário'
      'Login do Responsável'
      'Nome do Responsável'
      'Tipo de Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PR'
      'PESSOA PL'
      'CONTRATOIMOVEL C'
      'USUARIOSISTEMA U'
      'TIPOCONTRIMOB TC')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'C.FLGTIPOCONTRATO'
      'PL.NOME'
      'PL.RAZAOSOCIAL'
      'C.CONQUANTVAGAS'
      'C.IDLOCATARIO'
      'C.CODPORTFORMA'
      'C.FLGSTATUS')
    Filtro.Strings = (
      'C.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'C.IDLOCATARIO = PL.IDPESSOA(+)'
      'C.IDRESPONSAVEL = U.IDUSUARIO(+)'
      'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '30'
      '60'
      '18'
      '60'
      '20'
      '60'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      
        'SELECT IDTIPOCONTRIMOB, (TRIM(SIGLA) || '#39' - '#39' || TRIM(NOME)) AS ' +
        'DESCRICAO FROM TIPOCONTRIMOB')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'IDTIPOCONTRIMOB')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'DESCRICAO')
    Left = 120
    Top = 328
  end
  object MS_Fiador: TMontaSelect
    Template.IdConsulta = 111
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PA.NUMDOCUMENTO'
      'PA.NOME'
      'PA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PA'
      'AVALISTA A')
    CamposChave.Strings = (
      'A.IDAVALISTA'
      'PA.NOME'
      'PA.RAZAOSOCIAL'
      'PA.NUMDOCUMENTO')
    Filtro.Strings = (
      'A.IDAVALISTA = PA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 192
    Top = 8
  end
  object MS_Forn: TMontaSelect
    Template.IdConsulta = 113
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PF.NUMDOCUMENTO'
      'PF.NOME'
      'PF.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PF'
      'EMPRESAFORN E')
    CamposChave.Strings = (
      'E.IDFORCLI'
      'PF.NOME'
      'PF.RAZAOSOCIAL'
      'PF.NUMDOCUMENTO')
    Filtro.Strings = (
      'E.IDFORCLI = PF.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 192
    Top = 57
  end
  object MS_ImovelouMestre: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'IM.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL'
      'I.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'I.IMOCODIGO'
      'I.IMOAREA'
      'I.FLGTIPOIMOVEL')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.IDCIDADES = C.IDCIDADES(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 48
    Top = 296
  end
  object MS_ImovelMestre: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'IM.IMONOMEENDERECO'
      'IM.IMOLOGRADOURO'
      'IM.IMOBAIRRO'
      'C.NOME'
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Imóvel Mestre'
      'Nome do Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL IM'
      'CIDADES C')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'IM.IMONOME')
    Filtro.Strings = (
      'IM.FLGTIPOIMOVEL = 0'
      'IM.IDCIDADES = C.IDCIDADES(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '20'
      '50'
      '3')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 48
    Top = 248
  end
  object MS_ImovelAtivo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL'
      'I.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'I.IMOCODIGO'
      'I.IMOAREA'
      'I.FLGTIPOIMOVEL'
      'I.CODSUBCONTA'
      'I.FLGSTATUS'
      'I.FLGATIVO')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.FLGATIVO = 1'
      'I.IDMARCA = M.IDMARCA(+)'
      'I.IDCIDADES = C.IDCIDADES(+)'
      'I.FLGTIPOIMOVEL <> 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 48
    Top = 64
  end
  object MS_Imovel: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF'
      'DECODE(I.FLGSTATUSOCUPACAO,'#39'O'#39','#39'OCUPADO'#39','#39'DESOCUPADO'#39')'
      'I.IMOARREMATADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'L')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF'
      'Ocupação'
      'Arrematado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL'
      'I.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'I.IMOCODIGO'
      'I.IMOAREA'
      'I.FLGTIPOIMOVEL'
      'I.CODSUBCONTA'
      'I.FLGSTATUS'
      'I.IMOARREMATADO')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.IDCIDADES = C.IDCIDADES(+)'
      'I.FLGTIPOIMOVEL IN (0,1)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3'
      '16'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'SELECT '#39'S'#39' AS C1 FROM DUAL UNION SELECT '#39'N'#39' AS C1 FROM DUAL')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'C1')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'C1')
    Left = 48
    Top = 8
  end
  object MS_Lancamento: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VW.NOME_MESTRE'
      'VW.NOME_IMOVEL'
      'VW.IMOCODIGO'
      'VW.CONNUMERO'
      'VW.CONNOME'
      'VW.DESCCUSTORECIMO'
      'VW.VALOR_LANC'
      'VW.PREVISTO'
      'VW.EFETIVO'
      'VW.ANOCOMPETENCIA'
      'VW.MESCOMPETENCIA'
      'VW.DATAVENCIMENTO'
      'VW.DATALANCAMENTO'
      'VW.DATA_BAIXA'
      'VW.TRGDTINCLUSAO'
      'VW.NF_FORCLI'
      'VW.LOGIN_USUARIO'
      'VW.PORTADOR_FORMA'
      'VW.NOSSONUMERO'
      'VW.NODOCUMENTO'
      'VW.NUMAPGR'
      'DECODE(VW.FLGINTEGRADO, 0, '#39'NÃO'#39', '#39'SIM'#39') AS INTEGRADO'
      'DECODE(VW.RECPAG, '#39'P'#39', '#39'Pagar'#39', '#39'Receber'#39') AS RECPAG'
      
        'DECODE(VW.FLGORIGEMLANC, '#39'D'#39', '#39'Lançamento de Dívidas'#39', '#39'F'#39', '#39'Fol' +
        'ha de Aluguéis'#39', '#39'I'#39', '#39'Imp. Prestação de Contas'#39', '#39'L'#39', '#39'Lançamen' +
        'to Individual'#39', '#39'P'#39', '#39'Prestação de Contas'#39', '#39'R'#39', '#39'Folha de Remun' +
        'erações'#39', '#39'T'#39', '#39'Lançamento com Rateio'#39', '#39'V'#39', '#39'Lançamento de Prev' +
        'isão'#39')'
      'VW.CODTIPIMOVEL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N'
      'N'
      'N'
      'D'
      'D'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Código do Imóvel'
      'Nº Contrato'
      'Contrato'
      'Tipo Receita / Despesa'
      'Valor do Lançamento'
      'Valor Total Previsto'
      'Valor Total Efetivo'
      'Competência (Ano)'
      'Competência (Mês)'
      'Data Vencimento'
      'Data Lançamento'
      'Data de Baixa'
      'Data de Inclusão'
      'Favorecido / Debitado'
      'Usuário'
      'Conta-Caixa'
      'Nº Boleto'
      'Nº Documento'
      'nº AP/GR'
      'Integrado ?'
      '(P)agar / (R)eceber'
      'Origem'
      'Tipo Imóvel')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWLANCAMENTO VW')
    CamposChave.Strings = (
      'VW.IDLANCIMOVEL'
      'VW.CODDOCUMENTO'
      'VW.PLNCODIGO'
      'VW.NODOCUMENTO'
      'VW.IDPESSOA'
      'VW.CODTIPIMOVEL'
      'VW.IDDOCUMENTO'
      'VW.RECPAG')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '0000'
      '00'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      ''
      '#0'
      '#0'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '20'
      '15'
      '10'
      '20'
      '15'
      '10'
      '10'
      '10'
      '5'
      '4'
      '10'
      '10'
      '10'
      '10'
      '20'
      '10'
      '20'
      '12'
      '18'
      '10'
      '5'
      '10'
      '25'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 640
    Top = 34
  end
  object MS_Locatario: TMontaSelect
    Template.IdConsulta = 115
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMDOCUMENTO '
      'P.NOME'
      'P.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'LOCATARIO L')
    CamposChave.Strings = (
      'L.IDLOCATARIO'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'L.IDLOCATARIO = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 192
    Top = 155
  end
  object MS_Proposta: TMontaSelect
    Template.IdConsulta = 117
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.PRODATA'
      'DECODE(P.FLGSTATUS, '#39'I'#39', '#39'Inativa'#39', '#39'Ativa'#39')'
      'P.PRONUMERO'
      'P.PRONOME'
      'PP.NOME'
      'PP.RAZAOSOCIAL'
      'PR.NOME'
      'TI.DESCTIPOIMOVEL'
      'U.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data Proposta'
      'Status'
      'Nº da Proposta'
      'Proposta'
      'Nome do Proponente'
      'Razão Social'
      'Responsável'
      'Tipo de Investimento'
      'Usuário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'S'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PP'
      'PESSOA PR'
      'PROPOSTANOVONEGOC P'
      'TIPOIMOVEL TI'
      'USUARIOSISTEMA U')
    CamposChave.Strings = (
      'P.IDPROPOSTA'
      'P.PRONUMERO'
      'P.PRONOME'
      'P.CODTIPIMOVEL')
    Filtro.Strings = (
      'P.IDPROPRIETARIOUH = PP.IDPESSOA(+)'
      'P.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'P.CODTIPIMOVEL = TI.CODTIPIMOVEL(+)'
      'P.IDUSUARIO = U.IDUSUARIO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '7'
      '7'
      '25'
      '25'
      '25'
      '25'
      '15'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 192
    Top = 205
  end
  object MS_Proprietario: TMontaSelect
    Template.IdConsulta = 119
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PP.NUMDOCUMENTO'
      'PP.NOME'
      'PP.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF / CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PP'
      'PROPRIETARIOUH P')
    CamposChave.Strings = (
      'P.IDPROPRIETARIOUH'
      'PP.NOME'
      'PP.RAZAOSOCIAL'
      'PP.NUMDOCUMENTO')
    Filtro.Strings = (
      'P.IDPROPRIETARIOUH = PP.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 192
    Top = 254
  end
  object MS_ReservaOrcamen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'R.NUMRESERVA'
      'R.VLRRESERVA AS VALOR'
      'R.DATAREFERENCIA'
      'R.EXERCICIO'
      'R.PERIODO'
      'CO.CODCENTRORESPON'
      'CO.NOMECONTAORCAMEN')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Número Da Reserva'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período'
      'Centro Resp.'
      'Conta Orçamentária')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN R'
      'TIPOCUSTORECIMOV T'
      'CONTORCXTIPRECDES C'
      'CONTASORCAMEN CO')
    CamposChave.Strings = (
      'R.IDRESERVAORCAMEN'
      'R.NUMRESERVA')
    Filtro.Strings = (
      'C.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO'
      'C.IDPLANOORCAMEN = R.IDPLANOORCAMEN'
      'C.IDCONTAORCAMEN = R.IDCONTAORCAMEN'
      'CO.IDPLANOORCAMEN = R.IDPLANOORCAMEN'
      'CO.IDCONTAORCAMEN = R.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      '#,##0.00'
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 192
    Top = 303
  end
  object MS_Responsavel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PR.NUMDOCUMENTO'
      'PR.NOME'
      'PR.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PR'
      'RESPONSAVEL R')
    CamposChave.Strings = (
      'R.IDRESPONSAVEL'
      'PR.NOME'
      'PR.RAZAOSOCIAL'
      'PR.NUMDOCUMENTO')
    Filtro.Strings = (
      'R.IDRESPONSAVEL = PR.IDPESSOA'
      'R.FLGIMOBILIARIO = 1')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 256
    Top = 32
  end
  object MS_UnidAut: TMontaSelect
    Template.IdConsulta = 123
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.UNANOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Unidade Autônoma')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDAUT U'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'U.IDUNIDAUT'
      'U.UNANOME'
      'IM.IDIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL')
    Filtro.Strings = (
      'U.IDIMOVEL = I.IDIMOVEL(+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '25'
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 256
    Top = 82
  end
  object MS_Usuario: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'U.NOMEUSUARIO'
      'PU.NOME'
      'PU.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Login Usuário'
      'Nome'
      'CPF Usuário')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA PU'
      'USUARIOSISTEMA U')
    CamposChave.Strings = (
      'U.IDUSUARIO'
      'PU.NOME'
      'PU.RAZAOSOCIAL'
      'PU.NUMDOCUMENTO'
      'U.NOMEUSUARIO')
    Filtro.Strings = (
      'U.IDUSUARIO = PU.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '40'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 256
    Top = 131
  end
  object MS_ImovelContratoV: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'PL.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Código'
      'Nº do Contrato'
      'Nome do Contrato'
      'CPF/CNPJ Locatário'
      'Nome Locatário'
      'Razão Social Locatário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PL'
      'IMOVEL I'
      'IMOVEL IM'
      'CONTRATOXIMOVEL CX'
      'CONTRATOIMOVEL C')
    CamposChave.Strings = (
      'CX.IDCONTRATOIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'C.CONNUMERO'
      'C.CONNOME'
      'I.FLGATIVO'
      'C.FLGSTATUS'
      'I.CODTIPIMOVEL'
      'I.IMOCODIGO')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.IDIMOVEL = CX.IDIMOVEL'
      'CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'C.IDLOCATARIO = PL.IDPESSOA'
      'C.FLGSTATUS = '#39'V'#39
      'I.FLGATIVO = 1'
      'C.FLGTIPOCONTRATO = '#39'L'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '16'
      '10'
      '30'
      '18'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 48
    Top = 200
  end
  object MS_ImovelComOuSemContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'Suspenso'#39', '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vi' +
        'gente'#39', '#39'Encerrado'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'PL.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Nº do Contrato'
      'Nome do Contrato'
      'Status Contrato'
      'CPF/CNPJ Locatário'
      'Nome Locatário'
      'Razão Social Locatário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PL'
      'IMOVEL I'
      'IMOVEL IM'
      
        '(SELECT CI.IDIMOVEL, C.* FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL ' +
        'CI WHERE CI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL AND C.FLGTIPOC' +
        'ONTRATO = '#39'L'#39') C')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'C.IDCONTRATOIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'C.CONNUMERO'
      'C.CONNOME'
      'I.FLGATIVO'
      'C.FLGSTATUS'
      'I.CODTIPIMOVEL'
      'I.IMOCODIGO')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.IDIMOVEL = C.IDIMOVEL(+)'
      'C.IDLOCATARIO = PL.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '10'
      '30'
      '10'
      '18'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 40
    Top = 400
  end
  object MS_ImovelInativo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL'
      'I.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'I.IMOCODIGO'
      'I.IMOAREA'
      'I.FLGTIPOIMOVEL'
      'I.CODSUBCONTA')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.FLGATIVO = 0'
      'I.IDMARCA = M.IDMARCA(+)'
      'I.IDCIDADES = C.IDCIDADES(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 48
    Top = 104
  end
  object MS_BemFisico: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'B.PLACA'
      'B.DESBEM'
      'C.DESCCONJUNTO'
      'L.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Descrição'
      'Conjunto'
      'Localização')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM B'
      'CONJUNTO C'
      'LOCALIZACAO L'
      'GRUPO G')
    CamposChave.Strings = (
      'B.IDBEM'
      'B.PLACA'
      'B.DESBEM'
      'B.IDCONJUNTO'
      'C.DESCCONJUNTO'
      'B.IDGRUPO'
      'G.NOME'
      'C.IDLOCALIZACAO'
      'L.NOME')
    Filtro.Strings = (
      'B.IDCONJUNTO = C.IDCONJUNTO (+)'
      'C.IDLOCALIZACAO = L.IDLOCALIZACAO (+)'
      'B.IDGRUPO = G.IDGRUPO(+)'
      'B.CONTROLE = '#39'F'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '40'
      '40'
      '45')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 120
    Top = 136
  end
  object MS_Seguradora: TMontaSelect
    Template.IdConsulta = 119
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PS.NUMDOCUMENTO'
      'PS.NOME'
      'PS.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF / CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PS'
      'SEGURADORA S')
    CamposChave.Strings = (
      'S.IDSEGURADORA'
      'PS.NOME'
      'PS.RAZAOSOCIAL'
      'PS.NUMDOCUMENTO')
    Filtro.Strings = (
      'S.IDSEGURADORA = PS.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 256
    Top = 181
  end
  object MS_ImovelInativoouMestre: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'I.IDIMOVELMESTRE'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL'
      'I.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'I.IMOCODIGO'
      'I.IMOAREA'
      'I.FLGTIPOIMOVEL')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      '( I.FLGATIVO = 0 ) OR ( I.IDIMOVELMESTRE IS NULL )'
      'I.IDCIDADES = C.IDCIDADES(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 48
    Top = 344
  end
  object MS_Localizacao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'LC.NOME'
      'PR.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PR'
      'LOCALIZACAO LC')
    CamposChave.Strings = (
      'LC.IDLOCALIZACAO'
      'LC.IDPESSOA'
      'LC.NOME'
      'PR.RAZAOSOCIAL'
      'LC.IDRESPONSAVEL'
      'LC.CODCENTROCUSTO')
    Filtro.Strings = (
      'LC.IDRESPONSAVEL = PR.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 256
    Top = 230
  end
  object MS_ClasseBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CODHIERARQ'
      'C.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSEDEBEM C')
    CamposChave.Strings = (
      'C.IDCLASSEBEM'
      'C.DESCRICAO')
    Filtro.Strings = (
      'C.ANASINT = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 256
    Top = 280
  end
  object MS_ImovelObra: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF'
      'O.DESCCAFOBRA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF'
      'Descrição da Obra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CAFOBRA O'
      'CIDADES C')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'O.IDCAFOBRA'
      'O.DESCCAFOBRA'
      'O.IDGRUPO'
      'O.IDTIPOCUSTORECIMO')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'O.IDIMOVEL = I.IDIMOVEL'
      'I.IDCIDADES = C.IDCIDADES(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3'
      '250')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 192
    Top = 352
  end
  object MS_AlienaProposta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      'C.CONDATAINICIO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Nº  da Proposta'
      'Nome'
      'Data da Proposta')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL C'
      'PESSOA PL'
      'LOCATARIO L')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'C.CONDATAASSINATURA'
      'C.IDLOCATARIO'
      'PL.RAZAOSOCIAL')
    Filtro.Strings = (
      'C.FLGTIPOCONTRATO = '#39'P'#39
      'C.IDLOCATARIO = L.IDLOCATARIO(+)'
      'L.IDLOCATARIO = PL.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy')
    Larguras.Strings = (
      '20'
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 341
    Top = 8
  end
  object MS_AlienaContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      'C.CONDATAINICIO'
      'C.CONDATAASSINATURA'
      'P.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Nº  do Contrato'
      'Nome'
      'Data da Proposta'
      'Data do Contrato'
      'Administradora'
      'Comprador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL C'
      'PESSOA P'
      'LOCATARIO L'
      'ADMINIMOVEL A'
      'PESSOA PL')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'PL.RAZAOSOCIAL'
      'C.IDLOCATARIO'
      'C.CONDATAASSINATURA')
    Filtro.Strings = (
      'C.IDADMINIMOVEL = A.IDADMINIMOVEL(+)'
      'A.IDADMINIMOVEL = P.IDPESSOA(+)'
      'C.IDLOCATARIO = L.IDLOCATARIO(+)'
      'L.IDLOCATARIO = PL.IDPESSOA(+)'
      
        '   ( (C.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39')) OR C.IDCONTRATOIMOVEL IN( ' +
        'SELECT DISTINCT IDCONTRATOIMOVEL  FROM CONDPAGIMOVEL WHERE TIPOC' +
        'ONDPAG = '#39'C'#39') )')
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '18'
      '18'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 341
    Top = 58
  end
  object MS_AlienaPropostaContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      'C.CONDATAINICIO'
      'C.CONDATAASSINATURA'
      'C.FLGTIPOCONTRATO'
      'P.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº  da Proposta'
      'Nome'
      'Data da Proposta'
      'Data do Contrato'
      'Tipo (P, C, A)'
      'Administradora'
      'Locatário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL C'
      'ADMINIMOVEL A'
      'PESSOA P'
      'LOCATARIO L'
      'PESSOA PL')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'C.IDLOCATARIO'
      'C.CONDATAASSINATURA'
      'PL.RAZAOSOCIAL')
    Filtro.Strings = (
      'C.FLGTIPOCONTRATO IN('#39'P'#39', '#39'C'#39','#39'A'#39')'
      'C.IDADMINIMOVEL = A.IDADMINIMOVEL(+)'
      'A.IDADMINIMOVEL = P.IDPESSOA(+)'
      'C.IDLOCATARIO = L.IDLOCATARIO(+)'
      'L.IDLOCATARIO = PL.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '40'
      '10'
      '10'
      '1'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 341
    Top = 108
  end
  object MS_AlienaRepactua: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.RAZAOSOCIAL'
      'R.DATAREPACTUA'
      'CP.VLRFINANC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Nr. do Contrato'
      'Nome do Contrato'
      'Razão Social'
      'Data da Repactuação'
      'Saldo Devedor Inicial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL CI'
      'PESSOA P'
      'CONDPAGIMOVEL CP'
      'CONDPAGIMOVEL CPI'
      'REPCONDPAGIMOV R')
    CamposChave.Strings = (
      'CP.IDCONTRATOIMOVEL'
      'R.IDREPACTUA'
      'CP.IDCONDPAGIMOVEL'
      'CP.IDCONDINICIAL'
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.RAZAOSOCIAL'
      'CPI.DATAVENCIMENTO'
      'CPI.VLRFINANC'
      'CPI.NUMPARCELAS'
      'CP.DATAINI'
      'R.DATAREPACTUA')
    Filtro.Strings = (
      'R.IDREPACTUA = CP.IDREPACTUA'
      'CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL'
      'CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL'
      'P.IDPESSOA = CI.IDLOCATARIO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '50'
      '50'
      '18'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 341
    Top = 158
  end
  object MS_Loja: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'L.PISO'
      'L.NUMLOJA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Mestre'
      'Nome do Imóvel'
      'Piso'
      'Nr. da Loja')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDLOJA L'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'L.IDLOJA'
      'L.PISO'
      'L.NUMLOJA'
      'L.IDIMOVEL'
      'L.QTDEABL')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.IDIMOVEL = L.IDIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '5'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 341
    Top = 208
  end
  object MS_Indicador: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'I.DESCRICAO'
      'DECODE(I.TIPODADO,'#39'N'#39','#39'Numérico'#39','#39'C'#39','#39'Caracter'#39','#39'Data'#39')'
      'DECODE(I.TIPOVALOR,'#39'R'#39','#39'Receita'#39','#39'D'#39','#39'Despesa'#39','#39'Desempenho'#39')'
      'I.UNIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo de Dado'
      'Tipo de Valor'
      'Unidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDINDICADOR I'
      'INDGRPAPURACAO A'
      'INDGRPAPURACAO B')
    CamposChave.Strings = (
      'I.IDINDICADOR'
      'I.DESCRICAO'
      'I.TIPODADO'
      'I.TIPOVALOR'
      'I.FLGGRPAPURACAO'
      'I.FLGSUBGRPAPURACAO'
      'I.FLGCONTRATO'
      'I.PERIODICIDADE'
      'I.IDGRPPADRAO'
      'I.IDSUBGRPPADRAO'
      'A.DESCRICAO'
      'B.DESCRICAO')
    Filtro.Strings = (
      'I.IDGRPPADRAO=A.IDGRPAPURACAO(+)'
      'I.IDSUBGRPPADRAO=B.IDGRPAPURACAO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '1'
      '1'
      '5')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 341
    Top = 258
  end
  object MS_GrpApuracao: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GA.DESCRICAO'
      
        'DECODE(GA.TIPOGRUPO,'#39'C'#39','#39'CENTRO DE CUSTO'#39','#39'F'#39','#39'FUNCAO'#39','#39'A'#39','#39'ABON' +
        'OS'#39','#39'I'#39','#39'INADIMPLENCIA'#39','#39'H'#39','#39'HOTÉIS'#39','#39'OUTROS'#39')')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'INDGRPAPURACAO GA')
    CamposChave.Strings = (
      'GA.IDGRPAPURACAO'
      'GA.DESCRICAO'
      'GA.TIPOGRUPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 341
    Top = 308
  end
  object MS_ContratoLoja: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'CL.NUMCONTRATO'
      'CL.NOMCONTRATO'
      'DECODE(CL.TIPOCONTRATO,'#39'A'#39','#39'ANCORA'#39','#39'S'#39','#39'SATELITE'#39','#39'QUIOSQUE'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Nr. do Contrato'
      'Nome do Contrato'
      'Tipo de Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDCONTRATOLOJA CL'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'CL.IDCONTRATO'
      'CL.NUMCONTRATO'
      'CL.NOMCONTRATO'
      'CL.TIPOCONTRATO'
      'CL.IDIMOVEL'
      'CL.DATINICIO'
      'CL.FLGSTATUS')
    Filtro.Strings = (
      'CL.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '20'
      '60'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 341
    Top = 358
  end
  object MS_ImovelContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'Suspenso'#39', '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vi' +
        'gente'#39', '#39'Encerrado'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'PL.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Nº do Contrato'
      'Nome do Contrato'
      'Status Contrato'
      'CPF/CNPJ Locatário'
      'Nome Locatário'
      'Razão Social Locatário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PL'
      'IMOVEL I'
      'IMOVEL IM'
      'CONTRATOXIMOVEL CX'
      'CONTRATOIMOVEL C')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'C.CONNUMERO'
      'C.CONNOME'
      'I.FLGATIVO'
      'C.FLGSTATUS'
      'I.CODTIPIMOVEL'
      'I.IMOCODIGO')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.IDIMOVEL = CX.IDIMOVEL'
      'CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'C.IDLOCATARIO = PL.IDPESSOA'
      'C.FLGTIPOCONTRATO = '#39'L'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '10'
      '30'
      '10'
      '18'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 48
    Top = 152
  end
  object MS_CompOrcamto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      
        '(RESERVAORCAMEN.VLRRESERVA - RESERVAORCAMEN.VLRCOMPROMISSO) AS V' +
        'ALOR'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'RESERVAORCAMEN.OBSRESERVA')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nr. do Compromisso'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período'
      'Nome da Conta'
      'Número da Conta'
      'Observação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESCOMP = '#39'C'#39
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '50'
      '20'
      '70')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 203
    Top = 413
  end
  object MS_SubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'SubConta'
    Colunas.Strings = (
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 344
    Top = 408
  end
  object MS_TipoOperacao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'T.IDTIPOCUSTORECIMO'
      'T.DESCCUSTORECIMO'
      'T.RECCUSTO'
      'T.FLGTIPOOPER'
      
        'DECODE(T.RECCUSTO,'#39'R'#39','#39'Receita'#39','#39'D'#39','#39'Despesa'#39', '#39'O'#39', '#39'Operação'#39') ' +
        'AS DESC_TIPO'
      
        'DECODE(T.FLGTIPOOPER,'#39'A'#39','#39'Acréscimo'#39','#39'D'#39','#39'Desconto'#39') AS DESC_TIP' +
        'OOPER')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'ID Tipo de Operação'
      'Descrição'
      'Tipo'
      'Tipo de Operação'
      'Descrição da Operação'
      'Descrição do Tipo de Operaçào')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCUSTORECIMOV T')
    CamposChave.Strings = (
      'T.IDTIPOCUSTORECIMO'
      'T.DESCCUSTORECIMO'
      'T.FLGTIPOOPER')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '1'
      '1'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 272
    Top = 384
  end
  object MS_Unidade: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.IMONOME'
      'DECODE(U.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'U.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Nome da Unidade'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL U'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C'
      'IMOVEL I')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'U.IDIMOVEL'
      'U.IDIMOVELPAI'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'U.IMONOME'
      'I.IMONOME'
      'U.CODTIPIMOVEL'
      'U.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'U.IMOCODIGO'
      'U.IMOAREA'
      'U.FLGTIPOIMOVEL'
      'U.CODSUBCONTA'
      'U.FLGSTATUS')
    Filtro.Strings = (
      'U.IDMARCA = M.IDMARCA (+)'
      'U.IDIMOVELMESTRE = IM.IDIMOVEL'
      'U.IDIMOVELPAI    = I.IDIMOVEL'
      'U.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.IDCIDADES = C.IDCIDADES(+)'
      'U.FLGTIPOIMOVEL = 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 480
    Top = 16
  end
  object MS_UnidadeAtiva: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.IMONOME'
      'DECODE(U.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'U.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Nome da Unidade'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL U'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'U.IDIMOVEL'
      'U.IDIMOVELPAI'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'U.IMONOME'
      'I.IMONOME'
      'U.CODTIPIMOVEL'
      'U.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'U.IMOCODIGO'
      'U.IMOAREA'
      'U.FLGTIPOIMOVEL'
      'U.CODSUBCONTA'
      'U.FLGSTATUS')
    Filtro.Strings = (
      'U.IDMARCA = M.IDMARCA (+)'
      'U.IDIMOVELMESTRE = IM.IDIMOVEL'
      'U.IDIMOVELPAI    = I.IDIMOVEL'
      'U.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.IDCIDADES = C.IDCIDADES(+)'
      'U.FLGTIPOIMOVEL = 2'
      'U.FLGATIVO = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 480
    Top = 72
  end
  object MS_UnidadeContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'Suspenso'#39', '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vi' +
        'gente'#39', '#39'Encerrado'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'PL.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Nome da Unidade'
      'Status'
      'Código'
      'Nº do Contrato'
      'Nome do Contrato'
      'Status Contrato'
      'CPF/CNPJ Locatário'
      'Nome Locatário'
      'Razão Social Locatário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA PL'
      'IMOVEL U'
      'IMOVEL I'
      'IMOVEL IM'
      'CONTRATOXIMOVEL CX'
      'CONTRATOIMOVEL C')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'U.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME || '#39' - '#39' || U.IMONOME'
      'C.CONNUMERO'
      'C.CONNOME'
      'U.FLGATIVO'
      'C.FLGSTATUS'
      'I.CODTIPIMOVEL'
      'U.IMOCODIGO')
    Filtro.Strings = (
      'U.IDIMOVELMESTRE = IM.IDIMOVEL'
      'U.IDIMOVELPAI = I.IDIMOVEL'
      'U.IDIMOVEL = CX.IDIMOVEL'
      'CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'C.IDLOCATARIO = PL.IDPESSOA'
      'C.FLGTIPOCONTRATO = '#39'L'#39
      'U.FLGTIPOIMOVEL = 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '7'
      '16'
      '10'
      '30'
      '10'
      '18'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 480
    Top = 120
  end
  object MS_UnidadeContratoV: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'Suspenso'#39', '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vi' +
        'gente'#39', '#39'Encerrado'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'PL.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Nome da Unidade'
      'Status'
      'Código'
      'Nº do Contrato'
      'Nome do Contrato'
      'Status Contrato'
      'CPF/CNPJ Locatário'
      'Nome Locatário'
      'Razão Social Locatário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA PL'
      'IMOVEL U'
      'IMOVEL I'
      'IMOVEL IM'
      'CONTRATOXIMOVEL CX'
      'CONTRATOIMOVEL C')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'U.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME || '#39' - '#39' || U.IMONOME'
      'C.CONNUMERO'
      'C.CONNOME'
      'U.FLGATIVO'
      'C.FLGSTATUS'
      'I.CODTIPIMOVEL'
      'U.IMOCODIGO')
    Filtro.Strings = (
      'U.IDIMOVELMESTRE = IM.IDIMOVEL'
      'U.IDIMOVELPAI = I.IDIMOVEL'
      'U.IDIMOVEL = CX.IDIMOVEL'
      'CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'C.IDLOCATARIO = PL.IDPESSOA'
      'C.FLGTIPOCONTRATO = '#39'L'#39
      'U.FLGTIPOIMOVEL = 2'
      'C.FLGSTATUS = '#39'V'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '7'
      '16'
      '10'
      '30'
      '10'
      '18'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 480
    Top = 176
  end
  object MS_UnidadeComOuSemContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'Suspenso'#39', '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vi' +
        'gente'#39', '#39'Encerrado'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'PL.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Nome da Unidade'
      'Status'
      'Código'
      'Nº do Contrato'
      'Nome do Contrato'
      'Status Contrato'
      'CPF/CNPJ Locatário'
      'Nome Locatário'
      'Razão Social Locatário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA PL'
      'IMOVEL I'
      'IMOVEL IM'
      
        '(SELECT CI.IDIMOVEL, C.* FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL ' +
        'CI WHERE CI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL AND C.FLGTIPOC' +
        'ONTRATO = '#39'L'#39') C'
      'IMOVEL U')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'C.IDCONTRATOIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'C.CONNUMERO'
      'C.CONNOME'
      'I.FLGATIVO'
      'C.FLGSTATUS'
      'I.CODTIPIMOVEL'
      'I.IMOCODIGO')
    Filtro.Strings = (
      'U.IDIMOVELMESTRE = IM.IDIMOVEL'
      'U.IDIMOVELPAI = I.IDIMOVEL'
      'U.IDIMOVEL = C.IDIMOVEL(+)'
      'C.IDLOCATARIO = PL.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '10'
      '30'
      '10'
      '18'
      '30'
      '30'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 480
    Top = 232
  end
  object ivTradutor: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 114
    Top = 65535
    TargetsData = (
      1
      9
      (
        ''
        'Caption'
        0)
      (
        ''
        'Hint'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'Items'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Descricao'
        0))
  end
  object MS_ContratoFrame: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'SUSPENSO'#39', '#39'R'#39', '#39'RESCINDIDO'#39', '#39'V'#39', '#39'VI' +
        'GENTE'#39', '#39'ENCERRADO'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'U.NOMEUSUARIO'
      'PR.NOME'
      'TC.IDTIPOCONTRIMOB')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'L')
    Descricao.Strings = (
      'Nº do Contrato'
      'Nome do Contrato'
      'Status'
      'CPF/CNPJ Locatário'
      'Nome do Locatário'
      'Login do Responsável'
      'Nome do Responsável'
      'Tipo de Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PR'
      'PESSOA PL'
      'CONTRATOIMOVEL C'
      'USUARIOSISTEMA U'
      'TIPOCONTRIMOB TC')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'C.FLGTIPOCONTRATO'
      'PL.NOME'
      'PL.RAZAOSOCIAL'
      'C.CONQUANTVAGAS'
      'C.IDLOCATARIO'
      'C.CODPORTFORMA'
      'C.FLGSTATUS'
      
        'DECODE(C.MULTARESCISORIA, NULL,0, '#39#39', 0, C.MULTARESCISORIA) AS M' +
        'ULTA')
    Filtro.Strings = (
      'C.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'C.IDLOCATARIO = PL.IDPESSOA(+)'
      'C.IDRESPONSAVEL = U.IDUSUARIO(+)'
      'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '30'
      '60'
      '18'
      '60'
      '20'
      '60'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      
        'SELECT IDTIPOCONTRIMOB, (TRIM(SIGLA) || '#39' - '#39' || TRIM(NOME)) AS ' +
        'DESCRICAO FROM TIPOCONTRIMOB')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'IDTIPOCONTRIMOB')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'DESCRICAO')
    Left = 128
    Top = 384
  end
  object MS_ContratoSinal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      'C.CONDATAINICIO'
      'C.CONDATAASSINATURA'
      'P.NOME'
      'PL.NOME'
      'PR.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº  do Contrato'
      'Nome'
      'Data da Proposta'
      'Data do Contrato'
      'Administradora'
      'Comprador'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL C'
      'PESSOA P'
      'LOCATARIO L'
      'ADMINIMOVEL A'
      'PESSOA PL'
      'PESSOA PR'
      'CONDPAGIMOVEL CP'
      'PARCFINANCIMOV PA'
      'LANCTODOCUM LA')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'PL.RAZAOSOCIAL'
      'C.IDLOCATARIO'
      'C.CONDATAASSINATURA')
    Filtro.Strings = (
      'C.IDADMINIMOVEL = A.IDADMINIMOVEL(+)'
      'A.IDADMINIMOVEL = P.IDPESSOA(+)'
      'C.IDLOCATARIO = L.IDLOCATARIO(+)'
      'L.IDLOCATARIO = PL.IDPESSOA(+)'
      
        '   ( (C.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39')) OR C.IDCONTRATOIMOVEL IN( ' +
        'SELECT DISTINCT IDCONTRATOIMOVEL FROM CONDPAGIMOVEL WHERE TIPOCO' +
        'NDPAG = '#39'C'#39') )'
      'C.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'CP.TIPOCONDPAG = '#39'S'#39
      'PA.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL'
      'PA.CODDOCUMENTO IS NOT NULL'
      'PA.PLNCODIGO IS NOT NULL'
      'LA.CODDOCUMENTO = PA.CODDOCUMENTO'
      'TRIM(LA.OPERACAO) = '#39'5'#39
      'C.FLGSTATUS <> '#39'R'#39)
    Mascaras.Strings = (
      ''
      ''
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '10'
      '10'
      '60'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 485
    Top = 282
  end
  object MS_Lancamento_Estorna: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IME.IMONOME'
      'IMO.IMONOME'
      'IMO.IMOCODIGO'
      'CON.CONNUMERO'
      'CON.CONNOME'
      'TIP.DESCCUSTORECIMO'
      'DECODE(LAN.RECPAG, '#39'R'#39', LAN.VLRLANCRECEB, LAN.VLRLANCPAGAR)'
      
        'DECODE(LAN.RECPAG, '#39'R'#39', (NVL(LAN.VLRLANCRECEB,0) + NVL(LAN.VLRJU' +
        'ROS,0) + NVL(LAN.VLRMULTA,0) + NVL(VLRCORRECAOMON,0)),(NVL(LAN.V' +
        'LRLANCPAGAR,0) + NVL(LAN.VLRJUROS,0) + NVL(LAN.VLRMULTA,0) + NVL' +
        '(VLRCORRECAOMON,0)))'
      
        '(SELECT VBX.VALOR FROM LANCTODOCUM VBX WHERE VBX.CODDOCUMENTO = ' +
        'LAN.CODDOCUMENTO AND OPERACAO = 5)'
      'LAN.ANOCOMPETENCIA'
      'LAN.MESCOMPETENCIA'
      'LAN.DATAVENCIMENTO'
      'LAN.DATALANCAMENTO'
      
        'DECODE(LAN.FLGIMPORTADO, 1, LAN.DATAVENCIMENTO, DECODE(DOC.STATU' +
        'S, '#39'2'#39', (SELECT BX.DATABAIXA FROM RECBTOPAGTO BX WHERE ( LAN.COD' +
        'DOCUMENTO = BX.CODDOCUMENTO(+)) ), NULL))'
      'LAN.TRGDTINCLUSAO'
      'LAN.IDFORCLI'
      'USU.NOMEUSUARIO'
      'POR.DESCRICAO'
      'DOC.NOSSONUMERO'
      'LAN.NODOCUMENTO'
      'DOC.NUMAPGR'
      'DECODE(LAN.FLGINTEGRADO, 0, '#39'NÃO'#39', '#39'SIM'#39') AS INTEGRADO'
      'DECODE(LAN.RECPAG, '#39'P'#39', '#39'Pagar'#39', '#39'Receber'#39') AS RECPAG'
      
        'DECODE(LAN.FLGORIGEMLANC, '#39'D'#39', '#39'Lançamento de Dívidas'#39', '#39'F'#39', '#39'Fo' +
        'lha de Aluguéis'#39', '#39'I'#39', '#39'Imp. Prestação de Contas'#39', '#39'L'#39', '#39'Lançame' +
        'nto Individual'#39', '#39'P'#39', '#39'Prestação de Contas'#39', '#39'R'#39', '#39'Folha de Remu' +
        'nerações'#39', '#39'T'#39', '#39'Lançamento com Rateio'#39', '#39'V'#39', '#39'Lançamento de Pre' +
        'visão'#39')'
      'LAN.CODTIPIMOVEL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N'
      'N'
      'N'
      'D'
      'D'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Código do Imóvel'
      'Nº Contrato'
      'Contrato'
      'Tipo Receita / Despesa'
      'Valor do Lançamento'
      'Valor Total Previsto'
      'Valor Total Efetivo'
      'Competência (Ano)'
      'Competência (Mês)'
      'Data Vencimento'
      'Data Lançamento'
      'Data de Baixa'
      'Data de Inclusão'
      'Favorecido / Debitado'
      'Usuário'
      'Conta-Caixa'
      'Nº Boleto'
      'Nº Documento'
      'nº AP/GR'
      'Integrado ?'
      '(P)agar / (R)eceber'
      'Origem'
      'Tipo Imóvel')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LANCAMENTOSIMOVEL LAN'
      'IMOVEL IMO'
      'IMOVEL IME'
      'CONTRATOIMOVEL CON'
      'TIPOCUSTORECIMOV TIP'
      'DOCUMENTO DOC'
      'USUARIOSISTEMA USU'
      'PORTADORFORMA POR ')
    CamposChave.Strings = (
      'LAN.IDLANCIMOVEL'
      'LAN.CODDOCUMENTO'
      'LAN.PLNCODIGO'
      'LAN.NODOCUMENTO'
      'LAN.IDPESSOA'
      'LAN.CODTIPIMOVEL'
      'LAN.IDDOCUMENTO'
      'LAN.RECPAG')
    Filtro.Strings = (
      'LAN.IDDOCUMENTO  = DOC.CODDOCUMENTO(+)'
      'LAN.IDIMOVEL = IMO.IDIMOVEL'
      'IME.IDIMOVEL = IMO.IDIMOVELMESTRE'
      'CON.IDCONTRATOIMOVEL(+) = LAN.IDCONTRATOIMOVEL'
      'USU.IDUSUARIO = LAN.IDUSUARIOSISTEMA'
      '(POR.CODPORTFORMA(+) = LAN.CODPORTFORMA)'
      'TIP.IDTIPOCUSTORECIMO = LAN.IDTIPOCUSTORECIMO'
      'LAN.IDPESSOA = 1'
      'LAN.IDMODULO = 64'
      '( (DOC.STATUS IS NULL) OR (RTRIM(DOC.STATUS) <> '#39'2'#39'))'
      '( (LAN.FLGESTORNADO IS NULL) OR (LAN.FLGESTORNADO <> 1) )    ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '0000'
      '00'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      ''
      '#0'
      '#0'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '20'
      '15'
      '10'
      '20'
      '15'
      '10'
      '10'
      '10'
      '5'
      '4'
      '10'
      '10'
      '10'
      '10'
      '20'
      '10'
      '20'
      '12'
      '18'
      '10'
      '5'
      '10'
      '25'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 480
    Top = 338
  end
  object MS_ContratoDistratoContratual: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      'C.CONDATAINICIO'
      'C.CONDATAASSINATURA'
      'P.NOME'
      'PL.NOME'
      'PR.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº  do Contrato'
      'Nome'
      'Data da Proposta'
      'Data do Contrato'
      'Administradora'
      'Comprador'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL C'
      'PESSOA P'
      'LOCATARIO L'
      'ADMINIMOVEL A'
      'PESSOA PL'
      'PESSOA PR')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'PL.RAZAOSOCIAL'
      'C.IDLOCATARIO'
      'C.CONDATAASSINATURA')
    Filtro.Strings = (
      'C.IDADMINIMOVEL = A.IDADMINIMOVEL(+)'
      'A.IDADMINIMOVEL = P.IDPESSOA(+)'
      'C.IDLOCATARIO = L.IDLOCATARIO(+)'
      'L.IDLOCATARIO = PL.IDPESSOA(+)'
      'C.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'C.FLGSTATUS <> '#39'R'#39
      'C.FLGTIPOCONTRATO = '#39'C'#39' ')
    Mascaras.Strings = (
      ''
      ''
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '10'
      '10'
      '60'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 485
    Top = 394
  end
  object MS_Lancamento1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VW.NOME_MESTRE'
      'VW.NOME_IMOVEL'
      'VW.IMOCODIGO'
      'VW.CONNUMERO'
      'VW.CONNOME'
      'VW.DESCCUSTORECIMO'
      'VW.VALOR_LANC'
      'VW.PREVISTO'
      'VW.EFETIVO'
      'VW.ANOCOMPETENCIA'
      'VW.MESCOMPETENCIA'
      'VW.DATAVENCIMENTO'
      'VW.DATALANCAMENTO'
      'VW.DATA_BAIXA'
      'VW.TRGDTINCLUSAO'
      'VW.NF_FORCLI'
      'VW.LOGIN_USUARIO'
      'VW.PORTADOR_FORMA'
      'VW.NOSSONUMERO'
      'VW.NODOCUMENTO'
      'VW.NUMAPGR'
      'DECODE(VW.FLGINTEGRADO, 0, '#39'NÃO'#39', '#39'SIM'#39') AS INTEGRADO'
      'DECODE(VW.RECPAG, '#39'P'#39', '#39'Pagar'#39', '#39'Receber'#39') AS RECPAG'
      
        'DECODE(VW.FLGORIGEMLANC, '#39'D'#39', '#39'Lançamento de Dívidas'#39', '#39'F'#39', '#39'Fol' +
        'ha de Aluguéis'#39', '#39'I'#39', '#39'Imp. Prestação de Contas'#39', '#39'L'#39', '#39'Lançamen' +
        'to Individual'#39', '#39'P'#39', '#39'Prestação de Contas'#39', '#39'R'#39', '#39'Folha de Remun' +
        'erações'#39', '#39'T'#39', '#39'Lançamento com Rateio'#39', '#39'V'#39', '#39'Lançamento de Prev' +
        'isão'#39')'
      'VW.CODTIPIMOVEL'
      'VW.IDMODULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N'
      'N'
      'N'
      'D'
      'D'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Código do Imóvel'
      'Nº Contrato'
      'Contrato'
      'Tipo Receita / Despesa'
      'Valor do Lançamento'
      'Valor Total Previsto'
      'Valor Total Efetivo'
      'Competência (Ano)'
      'Competência (Mês)'
      'Data Vencimento'
      'Data Lançamento'
      'Data de Baixa'
      'Data de Inclusão'
      'Favorecido / Debitado'
      'Usuário'
      'Conta-Caixa'
      'Nº Boleto'
      'Nº Documento'
      'nº AP/GR'
      'Integrado ?'
      '(P)agar / (R)eceber'
      'Origem'
      'Tipo Imóvel'
      '')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWLANCAMENTO VW')
    CamposChave.Strings = (
      'VW.IDLANCIMOVEL'
      'VW.CODDOCUMENTO'
      'VW.PLNCODIGO'
      'VW.NODOCUMENTO'
      'VW.IDPESSOA'
      'VW.CODTIPIMOVEL'
      'VW.IDDOCUMENTO'
      'VW.RECPAG')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '0000'
      '00'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      ''
      '#0'
      '#0'
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '20'
      '15'
      '10'
      '20'
      '15'
      '10'
      '10'
      '10'
      '5'
      '4'
      '10'
      '10'
      '10'
      '10'
      '20'
      '10'
      '20'
      '12'
      '18'
      '10'
      '5'
      '10'
      '25'
      '5'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MS_Lancamento1BeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 640
    Top = 90
  end
  object MS_ContratoConfissao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'SUSPENSO'#39', '#39'R'#39', '#39'RESCINDIDO'#39', '#39'V'#39', '#39'VI' +
        'GENTE'#39', '#39'ENCERRADO'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'U.NOMEUSUARIO'
      'PR.NOME'
      'TC.IDTIPOCONTRIMOB')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'L')
    Descricao.Strings = (
      'Nº do Contrato'
      'Nome do Contrato'
      'Status'
      'CPF/CNPJ Locatário'
      'Nome do Locatário'
      'Login do Responsável'
      'Nome do Responsável'
      'Tipo de Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PR'
      'PESSOA PL'
      'CONTRATOIMOVEL C'
      'USUARIOSISTEMA U'
      'TIPOCONTRIMOB TC')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'C.FLGTIPOCONTRATO'
      'PL.NOME'
      'PL.RAZAOSOCIAL'
      'C.CONQUANTVAGAS'
      'C.IDLOCATARIO'
      'C.CODPORTFORMA'
      'C.FLGSTATUS')
    Filtro.Strings = (
      'C.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'C.IDLOCATARIO = PL.IDPESSOA(+)'
      'C.IDRESPONSAVEL = U.IDUSUARIO(+)'
      'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)'
      'C.FLGTIPOCONTRATO IN ('#39'L'#39','#39'D'#39')')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '30'
      '60'
      '18'
      '60'
      '20'
      '60'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      
        'SELECT IDTIPOCONTRIMOB, (TRIM(SIGLA) || '#39' - '#39' || TRIM(NOME)) AS ' +
        'DESCRICAO FROM TIPOCONTRIMOB')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'IDTIPOCONTRIMOB')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'DESCRICAO')
    Left = 488
    Top = 456
  end
end
