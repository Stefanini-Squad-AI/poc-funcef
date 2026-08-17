object GrupoConta: TGrupoConta
  Left = 0
  Top = 0
  Width = 168
  Height = 77
  TabOrder = 0
  object gbGrupoConta: TGroupBox
    Left = 0
    Top = 0
    Width = 168
    Height = 77
    Align = alClient
    Caption = ' Grupo da Conta '
    TabOrder = 0
    object lblGrupoConta: TLabel
      Left = 12
      Top = 54
      Width = 67
      Height = 13
      Caption = 'lblGrupoConta'
    end
    object cmpGrupoConta: TCMProcura
      Left = 10
      Top = 20
      Width = 152
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MostraMensagens = True
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      DataField = 'IDGRUPOORCAMEN'
      LookupChave = 'IDGRUPOORCAMEN'
      LookupDescricao = 'CODGRUPOORC'
      MontaSelect = MontaSelectGrupo
      LookupTabela = 'CM.GRUPOORCAMEN'
      DataBaseName = 'BaseDados'
      ReadOnly = False
    end
  end
  object MontaSelectGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.FLGANALSINT'
      'PLANOORCAMENTARIO.NOMEPLANOORC'
      'PLANOORCAMENTARIO.ANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Nome'
      'A/S'
      'Plano Orçamentário'
      'Exercício')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN'
      'PLANOORCAMENTARIO')
    CamposChave.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.FLGSINALGRUPO'
      'GRUPOORCAMEN.IDPLANOORCAMEN')
    Filtro.Strings = (
      'GRUPOORCAMEN.IDPLANOORCAMEN = PLANOORCAMENTARIO.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '1'
      '60'
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
    Left = 92
    Top = 14
  end
end
