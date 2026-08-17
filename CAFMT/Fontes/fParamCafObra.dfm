inherited frmParamCafObra: TfrmParamCafObra
  Left = 178
  Top = 189
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Obras'
  ClientHeight = 184
  ClientWidth = 449
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 145
    object Label4: TLabel
      Left = 24
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Obra'
    end
    object bbtnSelBem: TBitBtn
      Left = 401
      Top = 80
      Width = 23
      Height = 52
      TabOrder = 0
      OnClick = bbtnSelBemClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object rdgFlgObra: TRadioGroup
      Left = 24
      Top = 8
      Width = 401
      Height = 49
      Caption = ' Emitir '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Em Aberto'
        'Encerradas'
        'Todas')
      TabOrder = 1
    end
    object edDescObra: TMemo
      Left = 24
      Top = 80
      Width = 377
      Height = 52
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 145
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 274
      DockPos = 274
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 106
      DockPos = 106
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 459
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MSObra: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Obra'
    Colunas.Strings = (
      'CAFOBRA.DESCCAFOBRA'
      'CAFOBRA.DTAINICIOOBRA'
      'CAFOBRA.DTAENCERRAOBRA')
    TipodeDado.Strings = (
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Data de Inicio'
      'Data de Encerramento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CAFOBRA')
    CamposChave.Strings = (
      'CAFOBRA.IDCAFOBRA'
      'CAFOBRA.IDPESSOA'
      'CAFOBRA.DESCCAFOBRA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '18'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 96
    Top = 84
  end
end
