object dtmMS: TdtmMS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 84
  Top = 5
  Height = 490
  Width = 706
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
    Left = 128
    Top = 32
  end
  object MS_Bem: TMontaSelect
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
      'B.IDGRUPO = G.IDGRUPO(+)')
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
    Left = 128
    Top = 80
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
    Left = 128
    Top = 176
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
    Left = 128
    Top = 224
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
    Left = 128
    Top = 272
  end
  object MS_Contrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vigente'#39', '#39'Encerrad' +
        'o'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'U.NOMEUSUARIO'
      'PR.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Contrato'
      'Nome do Contrato'
      'Status'
      'CPF/CNPJ Locatário'
      'Nome do Locatário'
      'Login Responsável'
      'Nome do Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'S')
    Tabelas.Strings = (
      'PESSOA PR'
      'PESSOA PL'
      'CONTRATOIMOVEL C'
      'USUARIOSISTEMA U')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'C.FLGTIPOCONTRATO'
      'PL.NOME'
      'PL.RAZAOSOCIAL'
      'C.CONQUANTVAGAS'
      'C.IDLOCATARIO'
      'C.CODPORTFORMA')
    Filtro.Strings = (
      'C.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'C.IDLOCATARIO = PL.IDPESSOA(+)'
      'C.IDRESPONSAVEL = U.IDUSUARIO(+)')
    Mascaras.Strings = (
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
      '9'
      '14'
      '20'
      '12'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 128
    Top = 320
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
    Left = 208
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
    Left = 208
    Top = 56
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
      'I.IMOCIDADE')
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
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade')
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
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CARTEIRAINVEST CA')
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
      'I.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)')
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
      '6'
      '20'
      '20'
      '30'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
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
      'IM.IMOCIDADE')
    TipodeDado.Strings = (
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
      'Cidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL IM')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'IM.IMONOME')
    Filtro.Strings = (
      'IM.FLGTIPOIMOVEL = 0')
    Mascaras.Strings = (
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
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
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
      'I.IMOCIDADE')
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
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade')
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
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CARTEIRAINVEST CA')
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
      'CA.DESCCARTINVEST')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.FLGATIVO = 1'
      'I.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)'
      'I.IDMARCA = M.IDMARCA(+)')
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
      '6'
      '20'
      '20'
      '30'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 48
    Top = 56
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
      'I.IMOCIDADE')
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
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade')
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
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CARTEIRAINVEST CA')
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
      'CA.DESCCARTINVEST'
      'I.FLGSTATUS')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)')
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
      '6'
      '20'
      '20'
      '30'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 48
    Top = 8
  end
  object MS_Lancamento: TMontaSelect
    Template.IdConsulta = 83
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VW.NOME_MESTRE'
      'VW.NOME_IMOVEL'
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
      'VW.DOC_CAPCAR'
      'VW.NUMAPGR'
      'DECODE(VW.FLGINTEGRADO, 0, '#39'NÃO'#39', '#39'SIM'#39') AS INTEGRADO'
      'DECODE(VW.RECPAG, '#39'P'#39', '#39'Pagar'#39', '#39'Receber'#39') AS RECPAG'
      
        'DECODE(VW.FLGORIGEMLANC, '#39'D'#39', '#39'Lançamento de Dívidas'#39', '#39'F'#39', '#39'Fol' +
        'ha de Aluguéis'#39', '#39'I'#39', '#39'Imp. Prestação de Contas'#39', '#39'L'#39', '#39'Lançamen' +
        'to Individual'#39', '#39'P'#39', '#39'Prestação de Contas'#39', '#39'R'#39', '#39'Folha de Remun' +
        'erações'#39', '#39'T'#39', '#39'Lançamento com Rateio'#39', '#39'V'#39', '#39'Lançamento de Prev' +
        'isão'#39')')
    TipodeDado.Strings = (
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
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
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
      'Origem')
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
      '')
    Larguras.Strings = (
      '20'
      '20'
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
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 208
    Top = 104
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
    Left = 208
    Top = 152
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
    Left = 208
    Top = 200
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
    Left = 208
    Top = 248
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
    Left = 208
    Top = 296
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
    Left = 288
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
    Left = 288
    Top = 80
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
    Left = 288
    Top = 128
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
      'I.CODTIPIMOVEL')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.IDIMOVEL = CX.IDIMOVEL'
      'CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'C.IDLOCATARIO = PL.IDPESSOA'
      'C.FLGSTATUS = '#39'V'#39
      'I.FLGATIVO = 1')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 48
    Top = 200
  end
  object MS_ImovelContrato: TMontaSelect
    Template.IdConsulta = 109
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vigente'#39', '#39'Encerrad' +
        'o'#39') AS STATUS'
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
      'CX.IDCONTRATOIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'C.CONNUMERO'
      'C.CONNOME'
      'I.FLGATIVO'
      'C.FLGSTATUS'
      'I.CODTIPIMOVEL')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.IDIMOVEL = CX.IDIMOVEL'
      'CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'C.IDLOCATARIO = PL.IDPESSOA')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 48
    Top = 152
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
      'I.IMOCIDADE')
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
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade')
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
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CARTEIRAINVEST CA')
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
      'CA.DESCCARTINVEST')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.FLGATIVO = 0'
      'I.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)'
      'I.IDMARCA = M.IDMARCA(+)')
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
      '6'
      '20'
      '20'
      '30'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
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
    Left = 128
    Top = 128
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
    Left = 288
    Top = 176
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
      'I.IMOCIDADE')
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
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade')
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
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CARTEIRAINVEST CA')
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
      'I.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)'
      '( I.FLGATIVO = 0 ) OR ( I.IDIMOVELMESTRE IS NULL )')
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
      '6'
      '20'
      '20'
      '30'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
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
    Left = 288
    Top = 224
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
    Left = 288
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
      'I.IMOCIDADE'
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
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CAFOBRA O')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'O.IDCAFOBRA'
      'O.DESCCAFOBRA')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'O.IDIMOVEL = I.IDIMOVEL')
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
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '15'
      '250')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 209
    Top = 352
  end
  object MS_AlienaProposta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'CONTRATOIMOVEL.CONDATAINICIO')
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
      'CONTRATOIMOVEL')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL'
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME')
    Filtro.Strings = (
      'CONTRATOIMOVEL.FLGTIPOCONTRATO = '#39'P'#39)
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy')
    Larguras.Strings = (
      '20'
      '60'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 397
    Top = 16
  end
  object MS_AlienaContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'CONTRATOIMOVEL.CONDATAINICIO'
      'CONTRATOIMOVEL.CONDATAASSINATURA'
      'P.RAZAOSOCIAL'
      'P.NOME')
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
      'Razão Social'
      'Comprador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL'
      'PESSOA P')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL'
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'P.RAZAOSOCIAL')
    Filtro.Strings = (
      'CONTRATOIMOVEL.IDLOCATARIO = P.IDPESSOA'
      'CONTRATOIMOVEL.FLGTIPOCONTRATO = '#39'C'#39)
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 400
    Top = 72
  end
  object MS_AlienaPropostaContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'CONTRATOIMOVEL.CONDATAINICIO'
      'CONTRATOIMOVEL.CONDATAASSINATURA'
      'CONTRATOIMOVEL.FLGTIPOCONTRATO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Nº  da Proposta'
      'Nome'
      'Data da Proposta'
      'Data do Contrato'
      '<P>roposta,  <C>ontrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL'
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME')
    Filtro.Strings = (
      'CONTRATOIMOVEL.FLGTIPOCONTRATO IN('#39'P'#39', '#39'C'#39') ')
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      '')
    Larguras.Strings = (
      '20'
      '40'
      '10'
      '10'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 405
    Top = 128
  end
  object MS_AlienaRepactua: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.RAZAOSOCIAL'
      'CP.DATAINI'
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
      'Data de Início da Repactuação'
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
      'CP.DATAINI')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 405
    Top = 190
  end
end
