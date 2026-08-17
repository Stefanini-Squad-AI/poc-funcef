inherited frmCadParam: TfrmCadParam
  Left = 214
  Top = 169
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 368
  ClientWidth = 599
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 599
    Height = 282
    BorderWidth = 2
    object Label1: TLabel
      Left = 144
      Top = 22
      Width = 94
      Height = 13
      Caption = 'Título do Step 1'
    end
    object Label2: TLabel
      Left = 144
      Top = 49
      Width = 94
      Height = 13
      Caption = 'Título do Step 2'
    end
    object Label3: TLabel
      Left = 144
      Top = 73
      Width = 94
      Height = 13
      Caption = 'Título do Step 3'
    end
    object Label4: TLabel
      Left = 144
      Top = 97
      Width = 94
      Height = 13
      Caption = 'Título do Step 4'
    end
    object Label5: TLabel
      Left = 144
      Top = 124
      Width = 94
      Height = 13
      Caption = 'Título do Step 5'
    end
    object Label6: TLabel
      Left = 144
      Top = 148
      Width = 94
      Height = 13
      Caption = 'Título do Step 6'
    end
    object Label7: TLabel
      Left = 144
      Top = 172
      Width = 94
      Height = 13
      Caption = 'Título do Step 7'
    end
    object Label8: TLabel
      Left = 144
      Top = 199
      Width = 94
      Height = 13
      Caption = 'Título do Step 8'
    end
    object Label9: TLabel
      Left = 144
      Top = 223
      Width = 94
      Height = 13
      Caption = 'Título do Step 9'
    end
    object Label21: TLabel
      Left = 11
      Top = 103
      Width = 93
      Height = 13
      Caption = 'Quant. de Steps'
    end
    object Label11: TLabel
      Left = 368
      Top = 22
      Width = 101
      Height = 13
      Caption = 'Título do Step 11'
      Visible = False
    end
    object Label12: TLabel
      Left = 368
      Top = 49
      Width = 101
      Height = 13
      Caption = 'Título do Step 12'
      Visible = False
    end
    object Label13: TLabel
      Left = 368
      Top = 73
      Width = 101
      Height = 13
      Caption = 'Título do Step 13'
      Visible = False
    end
    object Label14: TLabel
      Left = 368
      Top = 97
      Width = 101
      Height = 13
      Caption = 'Título do Step 14'
      Visible = False
    end
    object Label15: TLabel
      Left = 368
      Top = 124
      Width = 101
      Height = 13
      Caption = 'Título do Step 15'
      Visible = False
    end
    object Label16: TLabel
      Left = 368
      Top = 148
      Width = 101
      Height = 13
      Caption = 'Título do Step 16'
      Visible = False
    end
    object Label17: TLabel
      Left = 368
      Top = 172
      Width = 101
      Height = 13
      Caption = 'Título do Step 17'
      Visible = False
    end
    object Label18: TLabel
      Left = 368
      Top = 199
      Width = 101
      Height = 13
      Caption = 'Título do Step 18'
      Visible = False
    end
    object Label19: TLabel
      Left = 368
      Top = 223
      Width = 101
      Height = 13
      Caption = 'Título do Step 19'
      Visible = False
    end
    object Label10: TLabel
      Left = 144
      Top = 246
      Width = 101
      Height = 13
      Caption = 'Título do Step 10'
    end
    object Label20: TLabel
      Left = 368
      Top = 246
      Width = 101
      Height = 13
      Caption = 'Título do Step 20'
    end
    object dbedSt1: TDBEdit
      Left = 248
      Top = 19
      Width = 100
      Height = 21
      DataField = 'TITSTEP1'
      DataSource = ds
      TabOrder = 1
    end
    object dbedSt2: TDBEdit
      Left = 248
      Top = 46
      Width = 100
      Height = 21
      DataField = 'TITSTEP2'
      DataSource = ds
      TabOrder = 2
    end
    object dbedSt3: TDBEdit
      Left = 248
      Top = 70
      Width = 100
      Height = 21
      DataField = 'TITSTEP3'
      DataSource = ds
      TabOrder = 3
    end
    object dbedSt4: TDBEdit
      Left = 248
      Top = 94
      Width = 100
      Height = 21
      DataField = 'TITSTEP4'
      DataSource = ds
      TabOrder = 4
    end
    object dbedSt5: TDBEdit
      Left = 248
      Top = 121
      Width = 100
      Height = 21
      DataField = 'TITSTEP5'
      DataSource = ds
      TabOrder = 5
    end
    object dbedSt6: TDBEdit
      Left = 248
      Top = 145
      Width = 100
      Height = 21
      DataField = 'TITSTEP6'
      DataSource = ds
      TabOrder = 6
    end
    object dbedSt7: TDBEdit
      Left = 248
      Top = 169
      Width = 100
      Height = 21
      DataField = 'TITSTEP7'
      DataSource = ds
      TabOrder = 7
    end
    object dbedSt8: TDBEdit
      Left = 248
      Top = 196
      Width = 100
      Height = 21
      DataField = 'TITSTEP8'
      DataSource = ds
      TabOrder = 8
    end
    object dbedSt9: TDBEdit
      Left = 248
      Top = 220
      Width = 100
      Height = 21
      DataField = 'TITSTEP9'
      DataSource = ds
      TabOrder = 9
    end
    object dbspeQtdSt: TwwDBSpinEdit
      Left = 11
      Top = 119
      Width = 43
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
    object dbedSt11: TDBEdit
      Left = 476
      Top = 19
      Width = 100
      Height = 21
      DataField = 'TITSTEP11'
      DataSource = ds
      TabOrder = 11
      Visible = False
    end
    object dbedSt12: TDBEdit
      Left = 476
      Top = 46
      Width = 100
      Height = 21
      DataField = 'TITSTEP12'
      DataSource = ds
      TabOrder = 12
      Visible = False
    end
    object dbedSt13: TDBEdit
      Left = 476
      Top = 70
      Width = 100
      Height = 21
      DataField = 'TITSTEP13'
      DataSource = ds
      TabOrder = 13
      Visible = False
    end
    object dbedSt14: TDBEdit
      Left = 476
      Top = 94
      Width = 100
      Height = 21
      DataField = 'TITSTEP14'
      DataSource = ds
      TabOrder = 14
      Visible = False
    end
    object dbedSt15: TDBEdit
      Left = 476
      Top = 121
      Width = 100
      Height = 21
      DataField = 'TITSTEP15'
      DataSource = ds
      TabOrder = 15
      Visible = False
    end
    object dbedSt16: TDBEdit
      Left = 476
      Top = 145
      Width = 100
      Height = 21
      DataField = 'TITSTEP16'
      DataSource = ds
      TabOrder = 16
      Visible = False
    end
    object dbedSt17: TDBEdit
      Left = 476
      Top = 169
      Width = 100
      Height = 21
      DataField = 'TITSTEP17'
      DataSource = ds
      TabOrder = 17
      Visible = False
    end
    object dbedSt18: TDBEdit
      Left = 476
      Top = 196
      Width = 100
      Height = 21
      DataField = 'TITSTEP18'
      DataSource = ds
      TabOrder = 18
      Visible = False
    end
    object dbedSt19: TDBEdit
      Left = 476
      Top = 220
      Width = 100
      Height = 21
      DataField = 'TITSTEP19'
      DataSource = ds
      TabOrder = 19
      Visible = False
    end
    object dbedSt10: TDBEdit
      Left = 248
      Top = 243
      Width = 100
      Height = 21
      DataField = 'TITSTEP10'
      DataSource = ds
      TabOrder = 10
    end
    object dbedSt20: TDBEdit
      Left = 476
      Top = 243
      Width = 100
      Height = 21
      DataField = 'TITSTEP20'
      DataSource = ds
      TabOrder = 20
    end
  end
  inherited Dock972: TDock97
    Width = 599
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
    Top = 329
    Width = 599
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMRH'
      'set'
      '  MOEDAPROCTRAB = :MOEDAPROCTRAB,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDRUBIRRF = :IDRUBIRRF,'
      '  MATRDIS = :MATRDIS,'
      '  LIMADM = :LIMADM,'
      '  LIMDEM = :LIMDEM,'
      '  LIMAFAST = :LIMAFAST,'
      '  LIMRETOR = :LIMRETOR,'
      '  NUMSTEPS = :NUMSTEPS,'
      '  TITSTEP1 = :TITSTEP1,'
      '  TITSTEP2 = :TITSTEP2,'
      '  TITSTEP3 = :TITSTEP3,'
      '  TITSTEP4 = :TITSTEP4,'
      '  TITSTEP5 = :TITSTEP5,'
      '  TITSTEP6 = :TITSTEP6,'
      '  TITSTEP7 = :TITSTEP7,'
      '  TITSTEP8 = :TITSTEP8,'
      '  TITSTEP9 = :TITSTEP9,'
      '  IDRUBFGTS = :IDRUBFGTS,'
      '  IDRUBINSS = :IDRUBINSS,'
      '  IDRUB13 = :IDRUB13,'
      '  IDRUBANTEC13 = :IDRUBANTEC13,'
      '  NORMALINI = :NORMALINI,'
      '  NORMALFIM = :NORMALFIM,'
      '  FERIASINI = :FERIASINI,'
      '  FERIASFIM = :FERIASFIM,'
      '  PGTO13INI = :PGTO13INI,'
      '  PGTO13FIM = :PGTO13FIM,'
      '  FLGDOISCARGOS = :FLGDOISCARGOS,'
      '  FLGNIVELINDIV = :FLGNIVELINDIV,'
      '  IDRUBFALTA = :IDRUBFALTA,'
      '  FLGINTEGRACONT = :FLGINTEGRACONT,'
      '  FLGINTEGRACAP = :FLGINTEGRACAP,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  FLGCRIASUBCONTA = :FLGCRIASUBCONTA,'
      '  FLGSENHAUSOPES = :FLGSENHAUSOPES,'
      '  FLGENDERINS = :FLGENDERINS,'
      '  FLGENDERALT = :FLGENDERALT,'
      '  FLGENDEREXC = :FLGENDEREXC,'
      '  FLGTELEFINS = :FLGTELEFINS,'
      '  FLGTELEFALT = :FLGTELEFALT,'
      '  FLGTELEFEXC = :FLGTELEFEXC,'
      '  FLGCONTTINS = :FLGCONTTINS,'
      '  FLGCONTTALT = :FLGCONTTALT,'
      '  FLGCONTTEXC = :FLGCONTTEXC,'
      '  FLGCURSOINS = :FLGCURSOINS,'
      '  FLGCURSOALT = :FLGCURSOALT,'
      '  FLGCURSOEXC = :FLGCURSOEXC,'
      '  FLGFERIAINS = :FLGFERIAINS,'
      '  FLGFERIAALT = :FLGFERIAALT,'
      '  FLGFERIAEXC = :FLGFERIAEXC,'
      '  FLGCTSALALT = :FLGCTSALALT,'
      '  FLGEMPRGINS = :FLGEMPRGINS,'
      '  FLGEMPRGALT = :FLGEMPRGALT,'
      '  FLGEMPRGEXC = :FLGEMPRGEXC'
      'where'
      '  NORMALINI = :OLD_NORMALINI and'
      '  NORMALFIM = :OLD_NORMALFIM')
    InsertSQL.Strings = (
      'insert into PARAMRH'
      
        '  (MOEDAPROCTRAB, IDMOTIVO, IDRUBIRRF, MATRDIS, LIMADM, LIMDEM, ' +
        'LIMAFAST, '
      
        '   LIMRETOR, NUMSTEPS, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, T' +
        'ITSTEP5, '
      
        '   TITSTEP6, TITSTEP7, TITSTEP8, TITSTEP9, IDRUBFGTS, IDRUBINSS,' +
        ' IDRUB13, '
      
        '   IDRUBANTEC13, NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, PGT' +
        'O13INI, '
      
        '   PGTO13FIM, FLGDOISCARGOS, FLGNIVELINDIV, IDRUBFALTA, FLGINTEG' +
        'RACONT, '
      
        '   FLGINTEGRACAP, TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGCRIASUBCONT' +
        'A, FLGSENHAUSOPES, '
      
        '   FLGENDERINS, FLGENDERALT, FLGENDEREXC, FLGTELEFINS, FLGTELEFA' +
        'LT, FLGTELEFEXC, '
      
        '   FLGCONTTINS, FLGCONTTALT, FLGCONTTEXC, FLGCURSOINS, FLGCURSOA' +
        'LT, FLGCURSOEXC, '
      
        '   FLGFERIAINS, FLGFERIAALT, FLGFERIAEXC, FLGCTSALALT, FLGEMPRGI' +
        'NS, FLGEMPRGALT, '
      '   FLGEMPRGEXC)'
      'values'
      
        '  (:MOEDAPROCTRAB, :IDMOTIVO, :IDRUBIRRF, :MATRDIS, :LIMADM, :LI' +
        'MDEM, :LIMAFAST, '
      
        '   :LIMRETOR, :NUMSTEPS, :TITSTEP1, :TITSTEP2, :TITSTEP3, :TITST' +
        'EP4, :TITSTEP5, '
      
        '   :TITSTEP6, :TITSTEP7, :TITSTEP8, :TITSTEP9, :IDRUBFGTS, :IDRU' +
        'BINSS, '
      
        '   :IDRUB13, :IDRUBANTEC13, :NORMALINI, :NORMALFIM, :FERIASINI, ' +
        ':FERIASFIM, '
      
        '   :PGTO13INI, :PGTO13FIM, :FLGDOISCARGOS, :FLGNIVELINDIV, :IDRU' +
        'BFALTA, '
      
        '   :FLGINTEGRACONT, :FLGINTEGRACAP, :TRGDTINCLUSAO, :TRGUSERINCL' +
        'USAO, :FLGCRIASUBCONTA, '
      
        '   :FLGSENHAUSOPES, :FLGENDERINS, :FLGENDERALT, :FLGENDEREXC, :F' +
        'LGTELEFINS, '
      
        '   :FLGTELEFALT, :FLGTELEFEXC, :FLGCONTTINS, :FLGCONTTALT, :FLGC' +
        'ONTTEXC, '
      
        '   :FLGCURSOINS, :FLGCURSOALT, :FLGCURSOEXC, :FLGFERIAINS, :FLGF' +
        'ERIAALT, '
      
        '   :FLGFERIAEXC, :FLGCTSALALT, :FLGEMPRGINS, :FLGEMPRGALT, :FLGE' +
        'MPRGEXC)')
    DeleteSQL.Strings = (
      'delete from PARAMRH'
      'where'
      '  NORMALINI = :OLD_NORMALINI and'
      '  NORMALFIM = :OLD_NORMALFIM')
    Left = 107
    Top = 94
  end
  inherited MontaSelect: TMontaSelect
    Left = 253
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 454
    Top = 10
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  PARAMRH')
  end
end
