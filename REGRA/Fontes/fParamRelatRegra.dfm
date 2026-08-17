inherited frmParamRelatRegra: TfrmParamRelatRegra
  Left = -110
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parâmetros para Impressão'
  ClientHeight = 268
  ClientWidth = 617
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 229
    object sbtnApagar: TSpeedButton
      Left = 345
      Top = 196
      Width = 124
      Height = 25
      Caption = 'Apagar Tudo'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      OnClick = sbtnApagarClick
    end
    object sbtnUmaUm: TSpeedButton
      Left = 219
      Top = 196
      Width = 124
      Height = 25
      Caption = 'Apagar um a um'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888FF8888888888888778888888888888F77F8888888888800F08
        8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
        88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
        08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
        F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
        FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
        788877FF7FF778F7788889999991777888888777777787788888889999988888
        8888887777788888888888888888888888888888888888888888}
      NumGlyphs = 2
      OnClick = sbtnUmaUmClick
    end
    object GroupBox4: TGroupBox
      Left = 5
      Top = 5
      Width = 606
      Height = 188
      Caption = 'Seleção de Dados'
      TabOrder = 0
      object lstDados: TListBox
        Left = 2
        Top = 15
        Width = 602
        Height = 171
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
      object lstId: TListBox
        Left = 96
        Top = 64
        Width = 89
        Height = 73
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
    end
    object btnSelecionar: TBitBtn
      Left = 486
      Top = 196
      Width = 122
      Height = 25
      Caption = 'Selecionar'
      Default = True
      TabOrder = 1
      OnClick = btnSelecionarClick
      Glyph.Data = {
        36010000424D3601000000000000760000002800000011000000100000000100
        040000000000C0000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777770000000777777700F077777700000007777700FFF077777700000007770
        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
        000077707E7E0777777770000000777700007777777770000000}
    end
  end
  inherited Dock971: TDock97
    Top = 229
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 435
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object ms2: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Identificador'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO')
    Filtro.Strings = (
      'CMPBD.CAMPODOBANCO = 0')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 296
    Top = 32
  end
  object ms3: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO'
      'CMPBD.ENTIDADE'
      'CMPBD.NOMEDOCAMPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador'
      'Descrição do Campo'
      'Tabela (Entidade)'
      'Nome do Campo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO')
    Filtro.Strings = (
      'CMPBD.CAMPODOBANCO > 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 360
    Top = 32
  end
  object ms1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FORMULA.IDFORMULA'
      'FORMULA.DESCRICAOFORMULA'
      'FORMULA.EXPRESSAOREAL'
      'GRPFORMULA.DESCGRUPOFORMULA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador'
      'Descrição'
      'Expressão Real'
      'Grupo da Fórmula')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FORMULA'
      'GRPFORMULA')
    CamposChave.Strings = (
      'FORMULA.IDFORMULA'
      'FORMULA.DESCRICAOFORMULA')
    Filtro.Strings = (
      'FORMULA.CODGRUPOFORMULA=GRPFORMULA.CODGRUPOFORMULA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '255'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 328
    Top = 32
  end
  object ms4: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador da Regra'
      'Nome da Regra'
      'Tipo de Regra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA'
      'GRUPOREGRAUSUARIO')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.IDGRUPOREGRA')
    Filtro.Strings = (
      'TIPOREGRA.IDTIPOREGRA = REGRA.IDTIPOREGRA'
      'TIPOREGRA.IDGRUPOREGRA = GRUPOREGRAUSUARIO.IDGRUPOREGRA'
      'GRUPOREGRAUSUARIO.FLGPROCURAR = 1')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 336
    Top = 72
  end
end
