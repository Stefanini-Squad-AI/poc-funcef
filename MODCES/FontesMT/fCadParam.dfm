inherited frmCadParam: TfrmCadParam
  Left = 278
  Top = 144
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 422
  ClientWidth = 754
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 754
    Height = 336
    BorderWidth = 2
    object gbxFaixasSal: TGroupBox
      Left = 272
      Top = 8
      Width = 467
      Height = 319
      Caption = 'Faixas Salariais'
      TabOrder = 1
      object Bevel1: TBevel
        Left = 10
        Top = 55
        Width = 222
        Height = 252
        Style = bsRaised
      end
      object labTit1: TLabel
        Tag = 1
        Left = 19
        Top = 69
        Width = 94
        Height = 13
        Caption = 'Título do Step 1'
      end
      object labTit2: TLabel
        Tag = 2
        Left = 19
        Top = 93
        Width = 94
        Height = 13
        Caption = 'Título do Step 2'
      end
      object labTit3: TLabel
        Tag = 3
        Left = 19
        Top = 117
        Width = 94
        Height = 13
        Caption = 'Título do Step 3'
      end
      object labTit4: TLabel
        Tag = 4
        Left = 19
        Top = 141
        Width = 94
        Height = 13
        Caption = 'Título do Step 4'
      end
      object labTit5: TLabel
        Tag = 5
        Left = 19
        Top = 165
        Width = 94
        Height = 13
        Caption = 'Título do Step 5'
      end
      object labTit6: TLabel
        Tag = 6
        Left = 19
        Top = 189
        Width = 94
        Height = 13
        Caption = 'Título do Step 6'
      end
      object labTit7: TLabel
        Tag = 7
        Left = 19
        Top = 213
        Width = 94
        Height = 13
        Caption = 'Título do Step 7'
      end
      object labTit8: TLabel
        Tag = 8
        Left = 19
        Top = 237
        Width = 94
        Height = 13
        Caption = 'Título do Step 8'
      end
      object labTit9: TLabel
        Tag = 9
        Left = 19
        Top = 261
        Width = 94
        Height = 13
        Caption = 'Título do Step 9'
      end
      object labStep: TLabel
        Left = 80
        Top = 15
        Width = 93
        Height = 13
        Caption = 'Quant. de Steps'
      end
      object labTit10: TLabel
        Tag = 10
        Left = 19
        Top = 285
        Width = 101
        Height = 13
        Caption = 'Título do Step 10'
        Visible = False
      end
      object bvFx2: TBevel
        Left = 234
        Top = 55
        Width = 222
        Height = 252
        Style = bsRaised
      end
      object labTit11: TLabel
        Tag = 11
        Left = 243
        Top = 69
        Width = 101
        Height = 13
        Caption = 'Título do Step 11'
        Visible = False
      end
      object labTit12: TLabel
        Tag = 12
        Left = 243
        Top = 93
        Width = 101
        Height = 13
        Caption = 'Título do Step 12'
        Visible = False
      end
      object labTit13: TLabel
        Tag = 13
        Left = 243
        Top = 117
        Width = 101
        Height = 13
        Caption = 'Título do Step 13'
        Visible = False
      end
      object labTit14: TLabel
        Tag = 14
        Left = 243
        Top = 141
        Width = 101
        Height = 13
        Caption = 'Título do Step 14'
        Visible = False
      end
      object labTit15: TLabel
        Tag = 15
        Left = 243
        Top = 165
        Width = 101
        Height = 13
        Caption = 'Título do Step 15'
        Visible = False
      end
      object labTit16: TLabel
        Tag = 16
        Left = 243
        Top = 189
        Width = 101
        Height = 13
        Caption = 'Título do Step 16'
        Visible = False
      end
      object labTit17: TLabel
        Tag = 17
        Left = 243
        Top = 213
        Width = 101
        Height = 13
        Caption = 'Título do Step 17'
        Visible = False
      end
      object labTit18: TLabel
        Tag = 18
        Left = 243
        Top = 237
        Width = 101
        Height = 13
        Caption = 'Título do Step 18'
        Visible = False
      end
      object labTit19: TLabel
        Tag = 19
        Left = 243
        Top = 261
        Width = 101
        Height = 13
        Caption = 'Título do Step 19'
        Visible = False
      end
      object labTit20: TLabel
        Tag = 20
        Left = 243
        Top = 285
        Width = 101
        Height = 13
        Caption = 'Título do Step 20'
        Visible = False
      end
      object dbedSt1: TDBEdit
        Tag = 1
        Left = 125
        Top = 66
        Width = 100
        Height = 21
        DataField = 'TITSTEP1'
        DataSource = ds
        TabOrder = 1
      end
      object dbedSt2: TDBEdit
        Tag = 2
        Left = 125
        Top = 90
        Width = 100
        Height = 21
        DataField = 'TITSTEP2'
        DataSource = ds
        TabOrder = 2
      end
      object dbedSt3: TDBEdit
        Tag = 3
        Left = 125
        Top = 114
        Width = 100
        Height = 21
        DataField = 'TITSTEP3'
        DataSource = ds
        TabOrder = 3
      end
      object dbedSt4: TDBEdit
        Tag = 4
        Left = 125
        Top = 138
        Width = 100
        Height = 21
        DataField = 'TITSTEP4'
        DataSource = ds
        TabOrder = 4
      end
      object dbedSt5: TDBEdit
        Tag = 5
        Left = 125
        Top = 162
        Width = 100
        Height = 21
        DataField = 'TITSTEP5'
        DataSource = ds
        TabOrder = 5
      end
      object dbedSt6: TDBEdit
        Tag = 6
        Left = 125
        Top = 186
        Width = 100
        Height = 21
        DataField = 'TITSTEP6'
        DataSource = ds
        TabOrder = 6
      end
      object dbedSt7: TDBEdit
        Tag = 7
        Left = 125
        Top = 210
        Width = 100
        Height = 21
        DataField = 'TITSTEP7'
        DataSource = ds
        TabOrder = 7
      end
      object dbedSt8: TDBEdit
        Tag = 8
        Left = 125
        Top = 234
        Width = 100
        Height = 21
        DataField = 'TITSTEP8'
        DataSource = ds
        TabOrder = 8
      end
      object dbedSt9: TDBEdit
        Tag = 9
        Left = 125
        Top = 258
        Width = 100
        Height = 21
        DataField = 'TITSTEP9'
        DataSource = ds
        TabOrder = 9
      end
      object dbspeQtdSt: TwwDBSpinEdit
        Left = 80
        Top = 31
        Width = 86
        Height = 21
        Increment = 1
        MaxValue = 20
        MinValue = 1
        Value = 1
        DataField = 'NUMSTEPS'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        OnChange = dbspeQtdStChange
      end
      object dbedSt10: TDBEdit
        Tag = 10
        Left = 125
        Top = 282
        Width = 100
        Height = 21
        DataField = 'TITSTEP10'
        DataSource = ds
        TabOrder = 10
        Visible = False
      end
      object dbedSt11: TDBEdit
        Tag = 11
        Left = 349
        Top = 66
        Width = 100
        Height = 21
        DataField = 'TITSTEP11'
        DataSource = ds
        TabOrder = 11
        Visible = False
      end
      object dbedSt12: TDBEdit
        Tag = 12
        Left = 349
        Top = 90
        Width = 100
        Height = 21
        DataField = 'TITSTEP12'
        DataSource = ds
        TabOrder = 12
        Visible = False
      end
      object dbedSt13: TDBEdit
        Tag = 13
        Left = 349
        Top = 114
        Width = 100
        Height = 21
        DataField = 'TITSTEP13'
        DataSource = ds
        TabOrder = 13
        Visible = False
      end
      object dbedSt14: TDBEdit
        Tag = 14
        Left = 349
        Top = 138
        Width = 100
        Height = 21
        DataField = 'TITSTEP14'
        DataSource = ds
        TabOrder = 14
        Visible = False
      end
      object dbedSt15: TDBEdit
        Tag = 15
        Left = 349
        Top = 162
        Width = 100
        Height = 21
        DataField = 'TITSTEP15'
        DataSource = ds
        TabOrder = 15
        Visible = False
      end
      object dbedSt16: TDBEdit
        Tag = 16
        Left = 349
        Top = 186
        Width = 100
        Height = 21
        DataField = 'TITSTEP16'
        DataSource = ds
        TabOrder = 16
        Visible = False
      end
      object dbedSt17: TDBEdit
        Tag = 17
        Left = 349
        Top = 210
        Width = 100
        Height = 21
        DataField = 'TITSTEP17'
        DataSource = ds
        TabOrder = 17
        Visible = False
      end
      object dbedSt18: TDBEdit
        Tag = 18
        Left = 349
        Top = 234
        Width = 100
        Height = 21
        DataField = 'TITSTEP18'
        DataSource = ds
        TabOrder = 18
        Visible = False
      end
      object dbedSt19: TDBEdit
        Tag = 19
        Left = 349
        Top = 258
        Width = 100
        Height = 21
        DataField = 'TITSTEP19'
        DataSource = ds
        TabOrder = 19
        Visible = False
      end
      object dbedSt20: TDBEdit
        Tag = 20
        Left = 349
        Top = 282
        Width = 100
        Height = 21
        DataField = 'TITSTEP20'
        DataSource = ds
        TabOrder = 20
        Visible = False
      end
    end
    object gbxPoliticaSal: TGroupBox
      Left = 16
      Top = 8
      Width = 236
      Height = 319
      Caption = 'Política Salarial'
      TabOrder = 0
      object dbrgIndPolitica: TDBRadioGroup
        Left = 26
        Top = 33
        Width = 184
        Height = 67
        Caption = 'Política Salarial Baseada em'
        DataField = 'INDPOLITICA'
        DataSource = ds
        Items.Strings = (
          'Classes e Faixas Salariais'
          'Metodologia Hay')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
        OnChange = dbrgIndPoliticaChange
      end
      object gbxDoisCargos: TDBRadioGroup
        Left = 26
        Top = 112
        Width = 184
        Height = 67
        Hint = 'Dois Cargos Para a Mesma Pessoa, Tipo Cargo e Função ?'
        Caption = 'Dois Cargos Atuais?'
        DataField = 'FLGDOISCARGOS'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Values.Strings = (
          '1'
          '0')
      end
      object dbrgNivelIndiv: TDBRadioGroup
        Left = 26
        Top = 191
        Width = 184
        Height = 67
        Hint = 'Define o Nível por Pessoa Alternativamente ao Cargo ?'
        Caption = 'Nível Salarial Individual?'
        DataField = 'FLGNIVELINDIV'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Values.Strings = (
          '1'
          '0')
      end
    end
  end
  inherited Dock972: TDock97
    Width = 754
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 754
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 653
    Top = 4
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 557
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 318
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 453
    Top = 1
  end
end
