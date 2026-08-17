object dtmMS: TdtmMS
  OldCreateOrder = False
  Left = 251
  Top = 145
  Height = 285
  Width = 455
  object MS_Comprador: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
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
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'LOCATARIO')
    CamposChave.Strings = (
      'LOCATARIO.IDLOCATARIO'
      'PESSOA.RAZAOSOCIAL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = LOCATARIO.IDLOCATARIO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 40
    Top = 8
  end
  object MS_Proposta: TMontaSelect
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
    Left = 40
    Top = 56
  end
  object MS_Imovel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'M.IMONOME'
      'I.IMONOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL M')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'M.IMONOME'
      'I.IMONOME'
      'I.IMOAREA'
      'I.IDIMOVELMESTRE'
      'I.FLGSTATUS')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = M.IDIMOVEL'
      'I.FLGTIPOIMOVEL = 1'
      'M.FLGTIPOIMOVEL = 0')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 125
    Top = 7
  end
  object MS_Contrato: TMontaSelect
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
    Left = 128
    Top = 56
  end
  object MS_PropostaContrato: TMontaSelect
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
    Left = 229
    Top = 56
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
    Left = 40
    Top = 120
  end
end
