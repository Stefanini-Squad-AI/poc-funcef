inherited frmParamANS: TfrmParamANS
  Left = 651
  Top = 305
  Caption = 'Relatório ANS'
  ClientHeight = 389
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 350
    object lblRef: TLabel
      Left = 16
      Top = 16
      Width = 63
      Height = 13
      Caption = 'Referência'
    end
    object lblDtInicio: TLabel
      Left = 16
      Top = 43
      Width = 66
      Height = 13
      Caption = 'Data Inicial'
    end
    object lblDtFim: TLabel
      Left = 16
      Top = 70
      Width = 59
      Height = 13
      Caption = 'Data Final'
    end
    object lblNumCI: TLabel
      Left = 16
      Top = 301
      Width = 68
      Height = 13
      Caption = 'Solicitação:'
    end
    object pgcDetalhe: TPageControl
      Left = 16
      Top = 94
      Width = 497
      Height = 201
      ActivePage = tbsContratos
      TabOrder = 4
      object tbsContratos: TTabSheet
        Caption = 'Contratos'
        object chklstContratos: TCheckListBox
          Left = 0
          Top = 0
          Width = 337
          Height = 173
          Align = alLeft
          ItemHeight = 13
          TabOrder = 0
        end
        object btnSelTodos: TBitBtn
          Left = 348
          Top = 7
          Width = 131
          Height = 25
          Caption = '   Seleciona Todos'
          TabOrder = 1
          TabStop = False
          OnClick = btnSelTodosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object btnInverteSel: TBitBtn
          Left = 348
          Top = 34
          Width = 131
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = btnInverteSelClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
      end
    end
    object cbbFiltroNumCI: TComboBox
      Left = 16
      Top = 317
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'começa com'
        'é igual a'
        'possui o texto'
        'é diferente de'
        'é nulo'
        'não é nulo')
    end
    object edtFiltroNumCI: TEdit
      Left = 171
      Top = 316
      Width = 342
      Height = 21
      TabOrder = 3
    end
    object pnlBarra: TPanel
      Left = 16
      Top = 32
      Width = 505
      Height = 2
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object medtDtInicial: TMaskEdit
      Left = 89
      Top = 39
      Width = 121
      Height = 21
      EditMask = '99/9999;1;'
      MaxLength = 7
      TabOrder = 0
      Text = '  /    '
    end
    object medtDtFinal: TMaskEdit
      Left = 88
      Top = 66
      Width = 121
      Height = 21
      EditMask = '99/9999;1;'
      MaxLength = 7
      TabOrder = 1
      Text = '  /    '
    end
  end
  inherited Dock971: TDock97
    Top = 350
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 448
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 376
    Top = 24
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 272
    Top = 88
  end
end
