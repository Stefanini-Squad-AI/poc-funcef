inherited FrmExcluiExportContab: TFrmExcluiExportContab
  Left = 224
  Top = 226
  Caption = 'Exclusão de Exportação Contábil'
  ClientHeight = 224
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 185
    object Label1: TLabel
      Left = 27
      Top = 40
      Width = 162
      Height = 13
      Caption = 'Lote de Exportação Contábil'
    end
    object EdtDescLote: TwwDBEdit
      Left = 27
      Top = 56
      Width = 433
      Height = 21
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnProcura: TBitBtn
      Left = 463
      Top = 55
      Width = 27
      Height = 23
      TabOrder = 1
      OnClick = bbtnProcuraClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 185
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 347
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 180
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 347
    Top = 11
  end
  object MsLote: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Lote de Exportação Contábil'
    Colunas.Strings = (
      'LOTEEXPORTACTB.DESCLOTE'
      'LOTEEXPORTACTB.DATALOTE'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição do lote de Exportação Contábil'
      'Data da Exportação'
      'Login Usuário que Efetuou a Exportação'
      'Nome do Usuário que Efetuou a Exportação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOTEEXPORTACTB'
      'USUARIOSISTEMA'
      'PESSOA')
    CamposChave.Strings = (
      'LOTEEXPORTACTB.IDLOTEEXPORTACTB'
      'LOTEEXPORTACTB.DESCLOTE')
    Filtro.Strings = (
      'LOTEEXPORTACTB.IDUSUARIO = USUARIOSISTEMA.IDUSUARIO'
      'USUARIOSISTEMA.IDUSUARIO = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '80'
      '18'
      '20'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 416
    Top = 96
  end
end
