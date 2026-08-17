object dtmMS: TdtmMS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 152
  Top = 41
  Height = 510
  Width = 598
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
    Left = 48
    Top = 16
  end
  object MS_CContabil: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CC.PLACONTA'
      'CC.PLANOME'
      'CC.PLAREDUZ')
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
      'PLANOCONTA CC')
    CamposChave.Strings = (
      'CC.PLACONTA'
      'CC.PLANOME'
      'CC.PLASUBCONTA'
      'CC.PLACCUST'
      'CC.PLANO')
    Filtro.Strings = (
      'CC.PLATIPO = '#39'A'#39)
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
    Left = 48
    Top = 64
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
    Left = 48
    Top = 160
  end
  object MS_Fiador: TMontaSelect
    Template.IdConsulta = 111
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
      'AVALISTA A')
    CamposChave.Strings = (
      'A.IDAVALISTA'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO'
      'A.RENDACOMP'
      'A.MARGEMCONSIG')
    Filtro.Strings = (
      'A.IDAVALISTA = P.IDPESSOA')
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
    Left = 136
    Top = 32
  end
  object MS_Forn: TMontaSelect
    Template.IdConsulta = 113
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
      'EMPRESAFORN E')
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
    Left = 136
    Top = 80
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 136
    Top = 224
  end
  object MS_Responsavel: TMontaSelect
    Template.IdConsulta = 0
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
      'CPF'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'RESPONSAVEL R')
    CamposChave.Strings = (
      'R.IDRESPONSAVEL'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'R.IDRESPONSAVEL = P.IDPESSOA'
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
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 224
    Top = 64
  end
  object MS_Usuario: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'U.NOMEUSUARIO'
      'P.NOME'
      'P.NUMDOCUMENTO')
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
      'PESSOA P'
      'USUARIOSISTEMA U')
    CamposChave.Strings = (
      'U.IDUSUARIO'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO'
      'U.NOMEUSUARIO')
    Filtro.Strings = (
      'U.IDUSUARIO = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '40'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 224
    Top = 112
  end
  object MS_Seguradora: TMontaSelect
    Template.IdConsulta = 119
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
      'CPF / CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'SEGURADORA S')
    CamposChave.Strings = (
      'S.IDSEGURADORA'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'S.IDSEGURADORA = P.IDPESSOA')
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
    Left = 224
    Top = 160
  end
  object MS_Regra: TMontaSelect
    Template.IdConsulta = 119
    Caption = 'Seleciona'
    Colunas.Strings = (
      'R.IDREGRA'
      'R.NOMEREGRA'
      'TR.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Tipo de Regra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA R'
      'TIPOREGRA TR')
    CamposChave.Strings = (
      'R.IDREGRA'
      'R.NOMEREGRA')
    Filtro.Strings = (
      '( R.IDTIPOREGRA = TR.IDTIPOREGRA )')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '8'
      '50'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 224
    Top = 16
  end
  object MS_Patro: TMontaSelect
    Template.IdConsulta = 113
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
      'PATRO PT')
    CamposChave.Strings = (
      'PT.IDPESSOA'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'PT.IDPESSOA = P.IDPESSOA')
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
    Left = 136
    Top = 176
  end
  object MS_Cidade: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.NOME'
      'E.CODESTADO'
      'E.NOMEESTADO'
      'P.NOMEPAIS'
      'P.CODINTERNACIONAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Cidade'
      'Cód. Estado ou UF'
      'Nome Estado'
      'Nome País'
      'Cód. País')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES C'
      'ESTADO E'
      'PAIS P')
    CamposChave.Strings = (
      'C.IDCIDADES'
      'C.NOME'
      'E.IDESTADO'
      'E.CODESTADO'
      'E.NOMEESTADO'
      'P.IDPAIS'
      'P.NOMEPAIS'
      'P.CODINTERNACIONAL')
    Filtro.Strings = (
      'C.IDESTADO = E.IDESTADO'
      'E.IDPAIS = P.IDPAIS')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '3'
      '20'
      '25'
      '3')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 48
    Top = 112
  end
  object MS_Part: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PATRO'
      'PESSOAFISICA'
      'PARTPREVPLAN'
      'ELEGPATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
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
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 136
    Top = 128
  end
  object MS_InscricaoEmptmo: TMontaSelect
    Template.IdConsulta = 119
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INS.IDINSCRICAOEMPTMO'
      'PP.NOME               AS TITULAR'
      'PP.NUMDOCUMENTO       AS CPF'
      'ST.DESCRICAO          AS SIT_PART'
      'EL.MATRICULA          AS MATRICULA_PATRO'
      'PPP.INSCRICAONUMERO   AS INSCRICAO_PLANO'
      'TC.TCEDESCRICAO       AS TIPO_EP'
      'TE.DESCTIPOEMPTMO     AS TIPO_CONTRATO'
      'PA.NOME               AS PATRO'
      'PL.NOME               AS PLANO_PREV'
      'PB.NOME               AS BENEFICIARIO'
      'INS.DATAINSC          AS DATA_INSCRICAO')
    TipodeDado.Strings = (
      'N'
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
      'D')
    Descricao.Strings = (
      'Nº Inscrição'
      'Nome Titular'
      'C.P.F.'
      'Situação Titular'
      'Matrícula Patro'
      'Insc. Plano'
      'Tipo de Empréstimo'
      'Tipo de Contrato'
      'Patrocinadora'
      'Plano Previdenciário'
      'Beneficiário'
      'Data Inscrição')
    SensivelACaixa.Strings = (
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
      'N')
    Tabelas.Strings = (
      'PESSOA PP'
      'PESSOA PB'
      'PESSOA PA'
      'ELEGPATRO EL'
      'PARTPREVPLAN PPP'
      'INSCRICAOEMPTMO INS'
      'PLANPREV PL'
      'TIPOCONTREMPTMO TC'
      'TIPOEMPTMO TE'
      'SITPART ST')
    CamposChave.Strings = (
      'INS.IDINSCRICAOEMPTMO'
      'PP.IDPESSOA AS IDTITULAR'
      'PB.IDPESSOA AS IDBENEF'
      'PP.NOME AS NOME_TITULAR'
      'PB.NOME AS NOME_BENEF')
    Filtro.Strings = (
      'PPP.FLGDESATIVADO       = 0'
      'PPP.SEQPROPOSTA         = '#39'1'#39
      'INS.IDPESSOA              = PP.IDPESSOA'
      'INS.IDBENEF               = PB.IDPESSOA(+)'
      'INS.IDPATRO               = PA.IDPESSOA'
      'INS.IDPLANOPREV           = PL.IDPLANOPREV'
      'PP.IDPESSOA             = PPP.IDPESSOA'
      'INS.IDPESSOA              = PPP.IDPESSOA'
      'INS.IDPATRO               = PPP.IDPESSJUR'
      'INS.IDPLANOPREV           = PPP.IDPLANOPREV'
      'INS.IDPESSOA              = EL.IDPESSOA'
      'INS.IDPATRO               = EL.IDPESSJUR'
      'EL.IDPESSOA             = PPP.IDPESSOA'
      'EL.IDPESSJUR            = PPP.IDPESSJUR'
      'PA.IDPESSOA             = EL.IDPESSJUR'
      'PA.IDPESSOA             = PPP.IDPESSJUR'
      'PL.IDPLANOPREV          = PPP.IDPLANOPREV'
      'INS.IDTIPOCONTREMPTMO     = TC.IDTIPOCONTREMPTMO'
      'TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO'
      'PPP.IDSITPART           = ST.IDSITPART')
    Mascaras.Strings = (
      ''
      ''
      '999.999.999-99;0;'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'dd/mm/yyyy')
    Larguras.Strings = (
      '11'
      '35'
      '14'
      '15'
      '13'
      '10'
      '25'
      '25'
      '25'
      '25'
      '35'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 136
    Top = 272
  end
  object MS_Beneficiario: TMontaSelect
    Template.IdConsulta = 111
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
      'BENEFSEGURO B')
    CamposChave.Strings = (
      'B.IDBENEFSEGURO'
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'B.IDBENEFSEGURO = P.IDPESSOA')
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
    Left = 224
    Top = 256
  end
  object MS_Solicitante: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME'
      'ELP.MATRICULA AS MATRICULA_TIT'
      
        'DECODE(DEP.IDTITULAR, NULL, '#39#39', DEP.IDPESSOA, ELP.MATRICULA, DEP' +
        '.MATRICULA) AS MATRICULA'
      'PPP.INSCRICAONUMERO AS INSCRICAO_TIT'
      
        'DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOC' +
        'UMENTO) AS CPF'
      
        'DECODE(DEP.IDTITULAR, NULL, '#39'Não Participante'#39', DEP.IDPESSOA, '#39'P' +
        'articipante'#39', '#39'Dependente'#39') AS TIPO'
      'PEP.NOME AS NOME_TIT'
      'PEP.NUMDOCUMENTO AS CPF_TIT'
      'SIP.DESCRICAO AS SIT_PART'
      'SPP.DESCRICAO AS SIT_PLANO'
      'PPA.NOME AS NOME_PATRO'
      'PLP.NOME AS NOME_PLANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matr. Titular'
      'Matrícula'
      'Inscrição Prev.'
      'C.P.F.'
      ' '
      'Nome do Titular'
      'C.P.F. do Titular'
      'Situação na Fundação'
      'Situação no Plano'
      'Patrocinadora'
      'Plano')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N'
      'N'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA       PDP'
      'PESSOA       PEP'
      'PESSOA       PPA'
      'DEPENTIT     DEP'
      'ELEGPATRO    ELP'
      
        '(SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIV' +
        'ADO = 0) PPP'
      'PLANPREV     PLP'
      'SITPART      SIP'
      'SITPLANOPREV SPP')
    CamposChave.Strings = (
      'DEP.IDPESSOA'
      'DEP.IDTITULAR'
      'DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME)'
      
        'DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOC' +
        'UMENTO)'
      
        'DECODE(DEP.IDTITULAR, NULL, '#39#39', DEP.IDPESSOA, ELP.MATRICULA, DEP' +
        '.MATRICULA)'
      'PEP.NOME'
      'PEP.NUMDOCUMENTO'
      'ELP.MATRICULA'
      'PPP.INSCRICAONUMERO'
      'PPA.NOME'
      'PLP.NOME'
      'ELP.IDPESSJUR'
      'PPP.IDPLANOPREV'
      'SIP.DESCRICAO'
      'SIP.IDSITPART'
      'SPP.DESCRICAO'
      'SIP.FLGINTERNO')
    Filtro.Strings = (
      'ELP.IDPESSOA       = PEP.IDPESSOA'
      'ELP.IDPESSJUR      = PPA.IDPESSOA'
      'ELP.IDPESSJUR      = PPP.IDPESSJUR(+)'
      'ELP.IDPESSOA       = PPP.IDPESSOA(+)'
      'ELP.IDPESSOA       = DEP.IDTITULAR(+)'
      'DEP.IDPESSOA       = PDP.IDPESSOA(+)'
      'PPP.IDPLANOPREV    = PLP.IDPLANOPREV(+)'
      'PPP.IDSITPART      = SIP.IDSITPART(+)'
      'PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '38'
      '12'
      '12'
      '13'
      '14'
      '15'
      '35'
      '14'
      '40'
      '40'
      '35'
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 224
    Top = 320
  end
  object MS_Mutuario: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'MUT.NOME'
      'DEP.MATRICULA AS MATRICULA'
      'ELP.MATRICULA AS MATRICULA_TIT'
      'PPP.INSCRICAONUMERO AS INSCRICAO_TIT'
      'MUT.NUMDOCUMENTO AS CPF'
      'TIT.NOME AS NOME_TIT'
      'TIT.NUMDOCUMENTO AS CPF_TIT'
      'SIP.DESCRICAO AS SIT_PART'
      'SPP.DESCRICAO AS SIT_PLANO'
      'PPA.NOME AS NOME_PATRO'
      'PLP.NOME AS NOME_PLANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matrícula'
      'Matr. Titular'
      'Inscrição Prev.'
      'C.P.F.'
      'Nome do Titular'
      'C.P.F. do Titular'
      'Situação na Fundação'
      'Situação no Plano'
      'Patrocinadora'
      'Plano Prev.')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA         MUT'
      'PESSOA         TIT'
      'PESSOA         PPA'
      'CONTRATOEMPTMO CON'
      'DEPENTIT       DEP'
      'ELEGPATRO      ELP'
      
        '(SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIV' +
        'ADO = 0) PPP'
      'PLANPREV       PLP'
      'SITPART        SIP'
      'SITPLANOPREV   SPP')
    CamposChave.Strings = (
      'MUT.IDPESSOA'
      'TIT.IDPESSOA'
      'MUT.NOME'
      'DEP.MATRICULA'
      'ELP.MATRICULA'
      'PPP.INSCRICAONUMERO'
      'MUT.NUMDOCUMENTO'
      'TIT.NOME'
      'TIT.NUMDOCUMENTO')
    Filtro.Strings = (
      'CON.IDBENEF        = MUT.IDPESSOA  '
      'CON.IDPESSOA       = TIT.IDPESSOA  '
      'CON.IDBENEF        = DEP.IDPESSOA  '
      'CON.IDPESSOA       = DEP.IDTITULAR  '
      'CON.IDPESSOA       = ELP.IDPESSOA  '
      'ELP.IDPESSOA       = TIT.IDPESSOA  '
      'ELP.IDPESSJUR      = PPA.IDPESSOA  '
      'ELP.IDPESSJUR      = PPP.IDPESSJUR  '
      'ELP.IDPESSOA       = PPP.IDPESSOA  '
      'ELP.IDPESSOA       = DEP.IDTITULAR  '
      'PPP.IDPLANOPREV    = PLP.IDPLANOPREV  '
      'PPP.IDSITPART      = SIP.IDSITPART'
      'PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      '999.999.999-99;0;'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '38'
      '12'
      '12'
      '13'
      '14'
      '35'
      '14'
      '40'
      '40'
      '35'
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    Left = 224
    Top = 368
  end
  object MS_ContratoEmptmo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME'
      'DEP.MATRICULA AS MATRICULA'
      'ELP.MATRICULA AS MATRICULA_TIT'
      'PPP.INSCRICAONUMERO AS INSCRICAO_TIT'
      'TCE.TCEDESCRICAO       AS TIPO_CONTRATO'
      'TEP.DESCTIPOEMPTMO     AS TIPO_EP'
      'MUT.NUMDOCUMENTO AS CPF'
      'TIT.NOME AS NOME_TIT'
      'TIT.NUMDOCUMENTO AS CPF_TIT'
      
        'DECODE(Con.FLGSITUACAO, '#39'A'#39', '#39'Ativo'#39', '#39'E'#39', '#39'Encerrado'#39', '#39'J'#39', '#39'Em' +
        ' Cobrança Jurídica'#39', '#39'K'#39', '#39'Em Quitação'#39', '#39'Q'#39', '#39'Quitado'#39', '#39'R'#39', '#39'R' +
        'enovado'#39')'
      'CON.DATAASSINATURA'
      'CON.DATACREDITO'
      'SIP.DESCRICAO AS SIT_PART'
      'SPP.DESCRICAO AS SIT_PLANO'
      'PPA.NOME AS NOME_PATRO'
      'PLP.NOME AS NOME_PLANO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº Contrato'
      'Nome'
      'Matrícula'
      'Matr. Titular'
      'Inscrição Prev.'
      'Tipo Contrato'
      'Tipo Empréstimo'
      'C.P.F.'
      'Nome do Titular'
      'C.P.F. do Titular'
      'Situação Contratual'
      'Data de Assinatura'
      'Data de Crédito'
      'Situação na Fundação'
      'Situação no Plano'
      'Patrocinadora'
      'Plano Prev.')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA          MUT'
      'PESSOA          TIT'
      'PESSOA          PPA'
      'CONTRATOEMPTMO  CON'
      'DEPENTIT        DEP'
      'ELEGPATRO       ELP'
      
        '(SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIV' +
        'ADO = 0) PPP'
      'PLANPREV        PLP'
      'SITPART         SIP'
      'SITPLANOPREV    SPP'
      'TIPOCONTREMPTMO TCE'
      'TIPOEMPTMO      TEP')
    CamposChave.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME')
    Filtro.Strings = (
      'CON.IDBENEF           = MUT.IDPESSOA'
      'CON.IDPESSOA          = TIT.IDPESSOA'
      'CON.IDBENEF           = DEP.IDPESSOA'
      'CON.IDPESSOA          = DEP.IDTITULAR'
      'CON.IDPESSOA          = ELP.IDPESSOA'
      'ELP.IDPESSOA          = TIT.IDPESSOA'
      'ELP.IDPESSJUR         = PPA.IDPESSOA'
      'ELP.IDPESSJUR         = PPP.IDPESSJUR'
      'ELP.IDPESSOA          = PPP.IDPESSOA'
      'ELP.IDPESSOA          = DEP.IDTITULAR'
      'PPP.IDPLANOPREV       = PLP.IDPLANOPREV'
      'PPP.IDSITPART         = SIP.IDSITPART'
      'PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'
      'CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      'TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      '999.999.999-99;0;'
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '38'
      '12'
      '12'
      '13'
      '25'
      '25'
      '14'
      '35'
      '14'
      '25'
      '10'
      '10'
      '40'
      '40'
      '35'
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 48
    Top = 304
  end
  object MS_ContrCancConc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME'
      'DEP.MATRICULA AS MATRICULA'
      'ELP.MATRICULA AS MATRICULA_TIT'
      'PPP.INSCRICAONUMERO AS INSCRICAO_TIT'
      'TCE.TCEDESCRICAO       AS TIPO_CONTRATO'
      'TEP.DESCTIPOEMPTMO     AS TIPO_EP'
      'MUT.NUMDOCUMENTO AS CPF'
      'TIT.NOME AS NOME_TIT'
      'TIT.NUMDOCUMENTO AS CPF_TIT'
      
        'DECODE(Con.FLGSITUACAO, '#39'A'#39', '#39'Ativo'#39', '#39'E'#39', '#39'Encerrado'#39', '#39'J'#39', '#39'Em' +
        ' Cobrança Jurídica'#39', '#39'K'#39', '#39'Em Quitação'#39', '#39'Q'#39', '#39'Quitado'#39', '#39'R'#39', '#39'R' +
        'enovado'#39')'
      'CON.DATAASSINATURA'
      'CON.DATACREDITO'
      'SIP.DESCRICAO AS SIT_PART'
      'SPP.DESCRICAO AS SIT_PLANO'
      'PPA.NOME AS NOME_PATRO'
      'PLP.NOME AS NOME_PLANO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº Contrato'
      'Nome'
      'Matrícula'
      'Matr. Titular'
      'Inscrição Prev.'
      'Tipo Contrato'
      'Tipo Empréstimo'
      'C.P.F.'
      'Nome do Titular'
      'C.P.F. do Titular'
      'Situação Contratual'
      'Data de Assinatura'
      'Data de Crédito'
      'Situação na Fundação'
      'Situação no Plano'
      'Patrocinadora'
      'Plano Prev.')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA          MUT'
      'PESSOA          TIT'
      'PESSOA          PPA'
      'HISTMOVEMPTMO   HME'
      'CONTRATOEMPTMO  CON'
      'DEPENTIT        DEP'
      'ELEGPATRO       ELP'
      
        '(SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIV' +
        'ADO = 0) PPP'
      'PLANPREV        PLP'
      'SITPART         SIP'
      'SITPLANOPREV    SPP'
      'TIPOCONTREMPTMO TCE'
      'TIPOEMPTMO      TEP')
    CamposChave.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME')
    Filtro.Strings = (
      'CON.FLGSITUACAO       = '#39'A'#39
      'HME.FLGBAIXADO        = 0'
      'HME.HMETIPOMOV        = 0'
      'HME.HMECENTRALIZA     = 1'
      '(HME.HMEVLREFETIVO    IS NULL) AND (HME.HMEDATAEFETIVA IS NULL)'
      '(HME.FLGESTORNADO     IS NULL)  OR (HME.FLGESTORNADO   = 0)'
      'HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO'
      'CON.IDBENEF           = MUT.IDPESSOA'
      'CON.IDPESSOA          = TIT.IDPESSOA'
      'CON.IDBENEF           = DEP.IDPESSOA'
      'CON.IDPESSOA          = DEP.IDTITULAR'
      'CON.IDPESSOA          = ELP.IDPESSOA'
      'ELP.IDPESSOA          = TIT.IDPESSOA'
      'ELP.IDPESSJUR         = PPA.IDPESSOA'
      'ELP.IDPESSJUR         = PPP.IDPESSJUR'
      'ELP.IDPESSOA          = PPP.IDPESSOA'
      'ELP.IDPESSOA          = DEP.IDTITULAR'
      'PPP.IDPLANOPREV       = PLP.IDPLANOPREV'
      'PPP.IDSITPART         = SIP.IDSITPART'
      'PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'
      'CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      'TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      '999.999.999-99;0;'
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '38'
      '12'
      '12'
      '13'
      '25'
      '25'
      '14'
      '35'
      '14'
      '25'
      '10'
      '10'
      '40'
      '40'
      '35'
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 48
    Top = 256
  end
  object MS_ContratoQuitacao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME'
      'DEP.MATRICULA AS MATRICULA'
      'ELP.MATRICULA AS MATRICULA_TIT'
      'PPP.INSCRICAONUMERO AS INSCRICAO_TIT'
      'TCE.TCEDESCRICAO       AS TIPO_CONTRATO'
      'TEP.DESCTIPOEMPTMO     AS TIPO_EP'
      'MUT.NUMDOCUMENTO AS CPF'
      'TIT.NOME AS NOME_TIT'
      'TIT.NUMDOCUMENTO AS CPF_TIT'
      
        'DECODE(Con.FLGSITUACAO, '#39'A'#39', '#39'Ativo'#39', '#39'E'#39', '#39'Encerrado'#39', '#39'J'#39', '#39'Em' +
        ' Cobrança Jurídica'#39', '#39'K'#39', '#39'Em Quitação'#39', '#39'Q'#39', '#39'Quitado'#39', '#39'R'#39', '#39'R' +
        'enovado'#39')'
      'CON.DATAASSINATURA'
      'CON.DATACREDITO'
      'SIP.DESCRICAO AS SIT_PART'
      'SPP.DESCRICAO AS SIT_PLANO'
      'PPA.NOME AS NOME_PATRO'
      'PLP.NOME AS NOME_PLANO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº Contrato'
      'Nome'
      'Matrícula'
      'Matr. Titular'
      'Inscrição Prev.'
      'Tipo Contrato'
      'Tipo Empréstimo'
      'C.P.F.'
      'Nome do Titular'
      'C.P.F. do Titular'
      'Situação Contratual'
      'Data de Assinatura'
      'Data de Crédito'
      'Situação na Fundação'
      'Situação no Plano'
      'Patrocinadora'
      'Plano Prev.')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA          MUT'
      'PESSOA          TIT'
      'PESSOA          PPA'
      'CONTRATOEMPTMO  CON'
      'DEPENTIT        DEP'
      'ELEGPATRO       ELP'
      
        '(SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIV' +
        'ADO = 0) PPP'
      'PLANPREV        PLP'
      'SITPART         SIP'
      'SITPLANOPREV    SPP'
      'TIPOCONTREMPTMO TCE'
      'TIPOEMPTMO      TEP')
    CamposChave.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME')
    Filtro.Strings = (
      'CON.FLGSITUACAO       = '#39'A'#39
      'CON.IDBENEF           = MUT.IDPESSOA'
      'CON.IDPESSOA          = TIT.IDPESSOA'
      'CON.IDBENEF           = DEP.IDPESSOA'
      'CON.IDPESSOA          = DEP.IDTITULAR'
      'CON.IDPESSOA          = ELP.IDPESSOA'
      'ELP.IDPESSOA          = TIT.IDPESSOA'
      'ELP.IDPESSJUR         = PPA.IDPESSOA'
      'ELP.IDPESSJUR         = PPP.IDPESSJUR'
      'ELP.IDPESSOA          = PPP.IDPESSOA'
      'ELP.IDPESSOA          = DEP.IDTITULAR'
      'PPP.IDPLANOPREV       = PLP.IDPLANOPREV'
      'PPP.IDSITPART         = SIP.IDSITPART'
      'PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'
      'CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      'TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      '999.999.999-99;0;'
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '38'
      '12'
      '12'
      '13'
      '25'
      '25'
      '14'
      '35'
      '14'
      '25'
      '10'
      '10'
      '40'
      '40'
      '35'
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 48
    Top = 352
  end
  object MS_ContrCancAmort: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME'
      'DEP.MATRICULA AS MATRICULA'
      'ELP.MATRICULA AS MATRICULA_TIT'
      'PPP.INSCRICAONUMERO AS INSCRICAO_TIT'
      'TCE.TCEDESCRICAO       AS TIPO_CONTRATO'
      'TEP.DESCTIPOEMPTMO     AS TIPO_EP'
      'MUT.NUMDOCUMENTO AS CPF'
      'TIT.NOME AS NOME_TIT'
      'TIT.NUMDOCUMENTO AS CPF_TIT'
      
        'DECODE(Con.FLGSITUACAO, '#39'A'#39', '#39'Ativo'#39', '#39'E'#39', '#39'Encerrado'#39', '#39'J'#39', '#39'Em' +
        ' Cobrança Jurídica'#39', '#39'K'#39', '#39'Em Quitação'#39', '#39'Q'#39', '#39'Quitado'#39', '#39'R'#39', '#39'R' +
        'enovado'#39')'
      'CON.DATAASSINATURA'
      'CON.DATACREDITO'
      'SIP.DESCRICAO AS SIT_PART'
      'SPP.DESCRICAO AS SIT_PLANO'
      'PPA.NOME AS NOME_PATRO'
      'PLP.NOME AS NOME_PLANO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº Contrato'
      'Nome'
      'Matrícula'
      'Matr. Titular'
      'Inscrição Prev.'
      'Tipo Contrato'
      'Tipo Empréstimo'
      'C.P.F.'
      'Nome do Titular'
      'C.P.F. do Titular'
      'Situação Contratual'
      'Data de Assinatura'
      'Data de Crédito'
      'Situação na Fundação'
      'Situação no Plano'
      'Patrocinadora'
      'Plano Prev.')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA          MUT'
      'PESSOA          TIT'
      'PESSOA          PPA'
      'HISTMOVEMPTMO   HME'
      'CONTRATOEMPTMO  CON'
      'DEPENTIT        DEP'
      'ELEGPATRO       ELP'
      
        '(SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIV' +
        'ADO = 0) PPP'
      'PLANPREV        PLP'
      'SITPART         SIP'
      'SITPLANOPREV    SPP'
      'TIPOCONTREMPTMO TCE'
      'TIPOEMPTMO      TEP')
    CamposChave.Strings = (
      'CON.IDCONTRATOEMPTMO'
      'MUT.NOME')
    Filtro.Strings = (
      'HME.HMETIPOMOV         = 2'
      'HME.FLGBAIXADO         = 0'
      '(HME.HMECENTRALIZA     = 1 OR HME.HMEDESTACADO = 1)'
      '(HME.HMEVLREFETIVO    IS NULL) AND (HME.HMEDATAEFETIVA IS NULL)'
      '(HME.FLGESTORNADO     IS NULL)  OR (HME.FLGESTORNADO   = 0)'
      'HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO'
      'CON.IDBENEF           = MUT.IDPESSOA'
      'CON.IDPESSOA          = TIT.IDPESSOA'
      'CON.IDBENEF           = DEP.IDPESSOA'
      'CON.IDPESSOA          = DEP.IDTITULAR'
      'CON.IDPESSOA          = ELP.IDPESSOA'
      'ELP.IDPESSOA          = TIT.IDPESSOA'
      'ELP.IDPESSJUR         = PPA.IDPESSOA'
      'ELP.IDPESSJUR         = PPP.IDPESSJUR'
      'ELP.IDPESSOA          = PPP.IDPESSOA'
      'ELP.IDPESSOA          = DEP.IDTITULAR'
      'PPP.IDPLANOPREV       = PLP.IDPLANOPREV'
      'PPP.IDSITPART         = SIP.IDSITPART'
      'PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'
      'CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      'TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      '999.999.999-99;0;'
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '38'
      '12'
      '12'
      '13'
      '25'
      '25'
      '14'
      '35'
      '14'
      '25'
      '10'
      '10'
      '40'
      '40'
      '35'
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 48
    Top = 208
  end
  object MS_Titular: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PP.NOME'
      'ST.DESCRICAO'
      'EL.MATRICULA'
      'PV.INSCRICAONUMERO'
      'PL.NOME'
      'PA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Participante'
      'Sit.Part.'
      'Matrícula'
      'Insc.Prev.'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N'
      'N'
      'S')
    Tabelas.Strings = (
      'PESSOA PP'
      'PESSOA PA'
      'ELEGPATRO EL'
      'PARTPREVPLAN PV'
      'PLANPREV PL'
      'SITPART ST')
    CamposChave.Strings = (
      'PV.IDPESSOA'
      'PV.IDPESSJUR'
      'PV.IDPLANOPREV'
      'PP.NOME'
      'PV.INSCRICAONUMERO'
      'EL.MATRICULA'
      'PL.NOME'
      'PA.NOME'
      'ST.DESCRICAO'
      'PV.SEQPROPOSTA'
      'ST.IDSITPART'
      'ST.FLGINTERNO'
      'PP.NUMDOCUMENTO')
    Filtro.Strings = (
      'PV.SEQPROPOSTA = '#39'1'#39
      'PV.IDSITPART = ST.IDSITPART'
      'PP.IDPESSOA = PV.IDPESSOA'
      'PA.IDPESSOA = PV.IDPESSJUR'
      'PL.IDPLANOPREV = PV.IDPLANOPREV'
      'EL.IDPESSJUR = PV.IDPESSJUR'
      'EL.IDPESSOA = PV.IDPESSOA'
      'PV.FLGDESATIVADO = 0'
      'ST.IDSITPART = PV.IDSITPART')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '10'
      '10'
      '10'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 296
    Top = 320
  end
  object MS_Benef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Beneficiário')
    SensivelACaixa.Strings = (
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'BENEFBFCIARIO B')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '97')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 296
    Top = 372
  end
end
