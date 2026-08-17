inherited teste: Tteste
  Left = 166
  Top = 122
  Caption = 'teste'
  ClientHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 337
    object Label1: TLabel
      Left = 140
      Top = 56
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'mes'
    end
    object Label2: TLabel
      Left = 86
      Top = 80
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'mesCobranca'
    end
    object Label3: TLabel
      Left = 114
      Top = 104
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'idMotivo'
    end
    object Label4: TLabel
      Left = 107
      Top = 128
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'idPlanAss'
    end
    object Label5: TLabel
      Left = 94
      Top = 152
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'idPlanoPrev'
    end
    object Label6: TLabel
      Left = 108
      Top = 176
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'idPessJur'
    end
    object Label7: TLabel
      Left = 116
      Top = 200
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'idTitular'
    end
    object Label8: TLabel
      Left = 83
      Top = 224
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'idDependente'
    end
    object Label9: TLabel
      Left = 106
      Top = 248
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'idContAss'
    end
    object mes: TDBEdit
      Left = 172
      Top = 52
      Width = 121
      Height = 21
      DataField = 'MES'
      DataSource = ds
      TabOrder = 0
    end
    object mesCobranca: TDBEdit
      Left = 172
      Top = 76
      Width = 121
      Height = 21
      DataField = 'MESCOBRANCA'
      DataSource = ds
      TabOrder = 1
    end
    object idMotivo: TDBEdit
      Left = 172
      Top = 100
      Width = 121
      Height = 21
      DataField = 'IDMOTIVO'
      DataSource = ds
      TabOrder = 2
    end
    object idPlanAss: TDBEdit
      Left = 172
      Top = 124
      Width = 121
      Height = 21
      DataField = 'IDPLANASS'
      DataSource = ds
      TabOrder = 3
    end
    object idPlanoPrev: TDBEdit
      Left = 172
      Top = 148
      Width = 121
      Height = 21
      DataField = 'IDPLANOPREV'
      DataSource = ds
      TabOrder = 4
    end
    object idPessJur: TDBEdit
      Left = 172
      Top = 172
      Width = 121
      Height = 21
      DataField = 'IDPESSJUR'
      DataSource = ds
      TabOrder = 5
    end
    object idTitular: TDBEdit
      Left = 172
      Top = 196
      Width = 121
      Height = 21
      DataField = 'IDTITULAR'
      DataSource = ds
      TabOrder = 6
    end
    object idDependente: TDBEdit
      Left = 172
      Top = 220
      Width = 121
      Height = 21
      DataField = 'IDDEPENDENTE'
      DataSource = ds
      TabOrder = 7
    end
    object idContAss: TDBEdit
      Left = 172
      Top = 244
      Width = 121
      Height = 21
      DataField = 'IDCONTASS'
      DataSource = ds
      TabOrder = 8
    end
    object DBNavigator1: TDBNavigator
      Left = 156
      Top = 272
      Width = 140
      Height = 25
      DataSource = ds
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      TabOrder = 9
    end
  end
  inherited Dock971: TDock97
    Top = 337
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 479
    Top = 65535
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' mes,'
      ' mesCobranca,'
      ' idMotivo,'
      ' idPlanAss,'
      ' idPlanoPrev,'
      ' idPessJur,'
      ' idTitular,'
      ' idDependente,'
      ' idContAss'
      'FROM'
      ' HSTCONTRIBASS')
    ControlType.Strings = (
      'FLGCOBCARNE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 341
    Top = 142
  end
  object ds: TDataSource
    DataSet = qry
    Left = 386
    Top = 142
  end
end
