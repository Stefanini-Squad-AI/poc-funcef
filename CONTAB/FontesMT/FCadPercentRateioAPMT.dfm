inherited frmCadPercentRateioAPMT: TfrmCadPercentRateioAPMT
  Left = 311
  Top = 84
  Caption = 'Percentuais de Rateio por Atividade/Projeto'
  ClientHeight = 373
  ClientWidth = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 400
    Height = 287
    inherited pnlMestre: TPanel
      Width = 390
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Nome do Rateio'
      end
      object Label7: TLabel
        Left = 16
        Top = 48
        Width = 184
        Height = 13
        Caption = 'Atividade/Projeto a ser Rateada'
      end
      object dbeNome: TwwDBEdit
        Left = 16
        Top = 24
        Width = 361
        Height = 21
        DataField = 'NOMERATEIO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object mskAtivProjRat: TMaskEdit
        Left = 16
        Top = 64
        Width = 73
        Height = 21
        TabOrder = 1
        OnExit = mskAtivProjRatExit
      end
      object btnAtivProjRat: TBitBtn
        Left = 88
        Top = 64
        Width = 25
        Height = 21
        TabOrder = 2
        OnClick = btnAtivProjRatClick
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
      object edtAtivProjRat: TEdit
        Left = 128
        Top = 64
        Width = 249
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 390
      Height = 179
      inherited pgctrlDetalhe: TPageControl
        Width = 292
        Height = 120
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 284
            Height = 92
            Selected.Strings = (
              'UNECODIGO'#9'8'#9'Ativ./Proj.'#9'F'
              'NOME'#9'19'#9'Nome'#9'F'
              'PERCRATEIO'#9'6'#9'Percent.'#9'F')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 284
            Height = 92
            object Label2: TLabel
              Left = 8
              Top = 8
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object Label3: TLabel
              Left = 8
              Top = 48
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object mskAtivProj: TMaskEdit
              Left = 8
              Top = 24
              Width = 73
              Height = 21
              TabOrder = 0
              OnExit = mskAtivProjExit
            end
            object btnAtivProj: TBitBtn
              Left = 80
              Top = 24
              Width = 25
              Height = 21
              TabOrder = 1
              OnClick = btnAtivProjClick
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
            object edtAtivProj: TEdit
              Left = 109
              Top = 24
              Width = 165
              Height = 21
              TabStop = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbrPercent: TDBRealEdit
              Left = 8
              Top = 64
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCRATEIO'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 382
      end
      inherited Dock974: TDock97
        Left = 296
        Height = 120
      end
    end
  end
  inherited Dock972: TDock97
    Width = 400
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 400
    inherited tb97Fundo: TToolbar97
      Left = 230
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 63
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 706
    Top = 303
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 286
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 248
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 352
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 316
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RATEIOAPEXTRA.NOMERATEIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Rateio')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RATEIOAPEXTRA')
    CamposChave.Strings = (
      'RATEIOAPEXTRA.IDRATEIOAPEXTRA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 240
    Top = 47
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnAbortConfirma = CmeDetalheAbortConfirma
    Left = 212
    Top = 175
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 270
    Top = 175
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNECODIGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 160
    Top = 104
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 261
    Top = 100
  end
  object cdsAtivProjD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 130
    Top = 175
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 330
    Top = 175
  end
end
