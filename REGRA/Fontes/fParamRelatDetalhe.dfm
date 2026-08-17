inherited frmParamRelatDetalhe: TfrmParamRelatDetalhe
  Left = 286
  Top = 318
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Seleção de Regra para Impressão'
  ClientHeight = 191
  ClientWidth = 401
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 401
    Height = 152
    object chkTipos: TCMchklistbox
      Left = 5
      Top = 97
      Width = 391
      Height = 50
      GlyphChecked.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FF00F000000000000F00F0FFFFFFFFFF0F00F0FFF0FFFFFF0F00F0FF000FFFFF
        0F00F0F00000FFFF0F00F0F00F000FFF0F00F0F0FFF000FF0F00F0FFFFFF000F
        0F00F0FFFFFFF00F0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
        0F00FFFFFFFFFFFFFF00}
      GlyphUnchecked.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FF00F000000000000F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
        0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
        0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
        0F00FFFFFFFFFFFFFF00}
      GlyphTopMargin = 0
      GlyphLeftMargin = 0
      TextLeftMargin = 0
      ReadOnly = False
      Align = alClient
      Columns = 3
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemHeight = 15
      ItemIndex = 0
      Items.Strings = (
        'Campos'
        'Fórmulas'
        'Regras'
        'Variáveis'
        'Regras Pai'
        'Campos Chave')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object GroupBox4: TGroupBox
      Left = 5
      Top = 5
      Width = 391
      Height = 92
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 9
        Width = 100
        Height = 13
        Caption = 'Número da Regra'
      end
      object Label2: TLabel
        Left = 6
        Top = 49
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object sbtnSelecionar: TSpeedButton
        Left = 132
        Top = 19
        Width = 93
        Height = 29
        Caption = 'Selecionar'
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00778888888888
          88887777000077888888888888887777000074444444444444887777000074BF
          BFBFBFBFB4887777000074FBFBF44BFBF4887777000074BFBF4224BFB4887777
          000074FBF422224B74887777000074BF42222224B4887777000074F4222A2222
          44887777000074B222AFA22224887777000074FA2AFBFA2222487777000074BF
          AFBFBFA222488777000074FBFBFBFBFA22248877000074BFBFBFBF44A2224887
          000074FBFBFBFB4BFA222488000074BFBFBFBF4F47A22248000074FBFBFBFB44
          777A224800007444444444477777A227000077777777777777777A7700007777
          77777777777777770000}
        OnClick = sbtnSelecionarClick
      end
      object edtId: TEdit
        Left = 6
        Top = 25
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtDesc: TEdit
        Left = 6
        Top = 65
        Width = 377
        Height = 21
        Enabled = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 152
    Width = 401
    inherited tb97Fundo: TToolbar97
      Left = 229
      DockPos = 229
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 61
      DockPos = 61
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 291
    Top = 29
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object ms1: TMontaSelect
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
      'Descrição da Regra'
      'Tipo da Regra')
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
    Left = 261
    Top = 29
  end
end
