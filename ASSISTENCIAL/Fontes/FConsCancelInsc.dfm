inherited frmConsCancelInsc: TfrmConsCancelInsc
  Left = 16
  Top = 99
  Caption = 'Cancelamento de Inscrição'
  ClientHeight = 440
  ClientWidth = 761
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 22
    Top = 99
    Width = 33
    Height = 13
    Caption = 'Plano'
  end
  object Shape8: TShape [1]
    Left = 5
    Top = 20
    Width = 16
    Height = 12
    Brush.Color = clSilver
  end
  object Label17: TLabel [2]
    Left = 33
    Top = 20
    Width = 100
    Height = 12
    AutoSize = False
    Caption = 'Mantido'
    WordWrap = True
  end
  object Shape9: TShape [3]
    Left = 5
    Top = 6
    Width = 16
    Height = 12
    Brush.Color = clWindow
  end
  object Label18: TLabel [4]
    Left = 33
    Top = 6
    Width = 79
    Height = 12
    AutoSize = False
    Caption = 'Ativo'
    WordWrap = True
  end
  object Shape10: TShape [5]
    Left = 5
    Top = 34
    Width = 16
    Height = 12
    Brush.Color = clNavy
  end
  object Label19: TLabel [6]
    Left = 33
    Top = 34
    Width = 139
    Height = 12
    AutoSize = False
    Caption = 'Assistido'
    WordWrap = True
  end
  object Shape11: TShape [7]
    Left = 5
    Top = 49
    Width = 16
    Height = 12
    Brush.Color = clTeal
  end
  object Label20: TLabel [8]
    Left = 33
    Top = 49
    Width = 143
    Height = 12
    AutoSize = False
    Caption = 'Cancelado por Inadimplência'
    WordWrap = True
  end
  object Shape12: TShape [9]
    Left = 5
    Top = 63
    Width = 16
    Height = 12
    Brush.Color = clGray
  end
  object Shape13: TShape [10]
    Left = 5
    Top = 77
    Width = 16
    Height = 12
    Brush.Color = clMaroon
  end
  object Label21: TLabel [11]
    Left = 33
    Top = 63
    Width = 140
    Height = 12
    AutoSize = False
    Caption = 'Cancelada por Desistência'
    WordWrap = True
  end
  object Label22: TLabel [12]
    Left = 33
    Top = 77
    Width = 141
    Height = 12
    AutoSize = False
    Caption = 'Cancelada por Óbito'
    WordWrap = True
  end
  object Shape14: TShape [13]
    Left = 5
    Top = 91
    Width = 16
    Height = 12
    Brush.Color = clOlive
  end
  object Label23: TLabel [14]
    Left = 33
    Top = 91
    Width = 141
    Height = 12
    AutoSize = False
    Caption = 'Cancelada por Demissão'
    WordWrap = True
  end
  object Shape15: TShape [15]
    Left = 5
    Top = 106
    Width = 16
    Height = 12
    Brush.Color = clYellow
  end
  object Shape16: TShape [16]
    Left = 5
    Top = 120
    Width = 16
    Height = 12
    Brush.Color = clBlue
  end
  object Shape17: TShape [17]
    Left = 5
    Top = 134
    Width = 16
    Height = 12
    Brush.Color = clAqua
  end
  object Label24: TLabel [18]
    Left = 33
    Top = 120
    Width = 141
    Height = 12
    AutoSize = False
    Caption = 'Cancelada a Pedido'
    WordWrap = True
  end
  object Label25: TLabel [19]
    Left = 33
    Top = 134
    Width = 141
    Height = 12
    AutoSize = False
    Caption = 'Suspenso'
    WordWrap = True
  end
  object Splitter1: TSplitter [20]
    Left = 0
    Top = 221
    Width = 761
    Height = 7
    Cursor = crVSplit
    Align = alTop
  end
  inherited pnlFundo: TPanel
    Left = 8
    Top = 357
    Width = 761
    Height = 75
    Align = alNone
  end
  inherited pnlConsultar: TPanel [22]
    Width = 761
    Height = 221
    inherited anmLupa: TAnimate
      Left = 623
      Top = 152
    end
    inherited bbtnConsultar: TButton
      Left = 674
      Top = 161
      Default = True
      Font.Color = clBlack
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    inherited pgctrlConsulta: TPageControl
      Top = 2
      Width = 618
      Height = 218
      ActivePage = tbsPrincipal
      inherited tbsPrincipal: TTabSheet
        inherited GroupBox1: TGroupBox
          Left = 0
          Top = -6
          Width = 273
          Height = 155
          inherited LABEL1: TLabel
            Left = 7
            Top = 7
          end
          inherited label4: TLabel
            Left = 7
            Top = 80
            Width = 97
            Caption = 'Plano Previdenciário'
          end
          object Label13: TLabel [2]
            Left = 7
            Top = 116
            Width = 85
            Height = 13
            Caption = 'Plano Assistencial'
          end
          object Label29: TLabel [3]
            Left = 7
            Top = 43
            Width = 20
            Height = 13
            Caption = 'Filial'
          end
          inherited dblkpcmbPatro: TwwDBLookupCombo
            Top = 21
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            Options = []
            ShowMatchText = True
          end
          inherited dblkpcmbPlano: TwwDBLookupCombo
            Top = 93
            Options = []
            ShowMatchText = True
          end
          object dblkpcmbPlanass: TwwDBLookupCombo
            Left = 7
            Top = 129
            Width = 229
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'NOME')
            LookupTable = qryPlanAss
            LookupField = 'IDPLANASS'
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object cmbfilial: TwwDBLookupCombo
            Left = 6
            Top = 57
            Width = 229
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qryFilial
            LookupField = 'IDPESSOA'
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        inherited GroupBox5: TGroupBox
          Left = 278
          Top = -2
          Width = 330
          Height = 192
          Caption = 'Participante'
          inherited Label8: TLabel
            Left = 8
            Top = 96
            Width = 156
            Caption = 'Número de Inscrição Assistencial'
          end
          inherited Label9: TLabel
            Left = 185
            Top = 96
          end
          inherited Label2: TLabel
            Left = 310
            Top = 128
            Visible = False
          end
          object Label7: TLabel [3]
            Left = 9
            Top = 56
            Width = 28
            Height = 13
            Caption = 'Nome'
          end
          object Label6: TLabel [4]
            Left = 8
            Top = 135
            Width = 168
            Height = 13
            Caption = 'Número de Inscrição Previdenciária'
          end
          object Label16: TLabel [5]
            Left = 185
            Top = 135
            Width = 23
            Height = 13
            Caption = 'Data'
          end
          object Label26: TLabel [6]
            Left = 8
            Top = 18
            Width = 45
            Height = 13
            Caption = 'Matrícula'
          end
          object Label27: TLabel [7]
            Left = 196
            Top = 18
            Width = 20
            Height = 13
            Caption = 'CPF'
          end
          inherited edNumInsc: TEdit
            Left = 8
            Top = 112
            Width = 133
          end
          inherited dblkpcmbSituacao: TwwDBLookupCombo
            Left = 318
            Top = 141
            Visible = False
          end
          inherited mskdlgDataInsc: TCMDateTimePicker
            Left = 185
            Top = 110
            Width = 111
          end
          object ednome: TEdit
            Left = 8
            Top = 70
            Width = 315
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 3
          end
          object numinscprev: TEdit
            Left = 8
            Top = 149
            Width = 133
            Height = 21
            TabOrder = 4
          end
          object datainscprev: TCMDateTimePicker
            Left = 185
            Top = 149
            Width = 111
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 5
          end
          object edmatricula: TEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 6
          end
          object edcpf: TEdit
            Left = 195
            Top = 32
            Width = 128
            Height = 21
            TabOrder = 7
          end
        end
        inherited RadioGroup1: TRadioGroup
          Left = 592
          Top = 164
          Height = 41
          Items.Strings = (
            'Assistido'
            'Contribuinte')
          Visible = False
        end
        inherited rgrpStatusInsc: TRadioGroup
          Left = 0
          Top = 148
          Width = 273
          Height = 42
          Columns = 3
          ItemIndex = 5
          Items.Strings = (
            'Normal'
            'Cancelado'
            'Canc.Inadimp.'
            'Inadimplente'
            'Transferido'
            'Todos')
          TabStop = True
        end
      end
      inherited tbsAvancada: TTabSheet
        inherited lstTabelas: TListBox
          Left = 0
          Top = 0
          Width = 129
          Height = 190
          Align = alLeft
          Items.Strings = (
            'Participante'
            'Dependente'
            'Beneficiários'
            ''
            '')
        end
        inherited pnlPesqAvanc: TPanel
          Left = 159
          Top = 0
          Width = 451
          Height = 190
          Align = alRight
          Caption = ''
          inherited edConteudo: TEdit
            Text = ''
          end
          inherited rgrpSexo: TRadioGroup [8]
            Left = 278
            Top = 175
            Visible = False
          end
          inherited rgrpFlag: TRadioGroup [9]
            Left = 177
            Top = 170
            Visible = False
          end
          inherited rgrpEstCivil: TRadioGroup [10]
            Left = 77
            Top = 171
            Visible = False
          end
          inherited mskedMes: TcmMaskEditDlg [11]
            Left = 185
            Top = 172
            Visible = False
          end
          inherited mskedData: TCMDateTimePicker [12]
            Left = 160
            Top = 172
            Visible = False
          end
          inherited lstResult: TListBox [13]
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 628
      Top = 24
      Width = 125
      Height = 106
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Shape3: TShape
        Left = 5
        Top = 8
        Width = 16
        Height = 12
      end
      object Label10: TLabel
        Left = 33
        Top = 7
        Width = 79
        Height = 12
        AutoSize = False
        Caption = 'Normal'
        WordWrap = True
      end
      object Shape4: TShape
        Left = 5
        Top = 45
        Width = 16
        Height = 12
        Brush.Color = clAqua
      end
      object Label11: TLabel
        Left = 33
        Top = 44
        Width = 104
        Height = 12
        AutoSize = False
        Caption = 'Canc. Inadimp.'
        WordWrap = True
      end
      object Shape5: TShape
        Left = 5
        Top = 64
        Width = 16
        Height = 12
        Brush.Color = clSilver
      end
      object Shape6: TShape
        Left = 5
        Top = 83
        Width = 16
        Height = 12
        Brush.Color = clYellow
      end
      object Label14: TLabel
        Left = 33
        Top = 64
        Width = 106
        Height = 12
        AutoSize = False
        Caption = 'Inadimplente'
        WordWrap = True
      end
      object Label15: TLabel
        Left = 33
        Top = 83
        Width = 106
        Height = 12
        AutoSize = False
        Caption = 'Transferido'
        WordWrap = True
      end
      object Shape1: TShape
        Left = 5
        Top = 27
        Width = 16
        Height = 12
        Brush.Color = clRed
      end
      object Label28: TLabel
        Left = 33
        Top = 26
        Width = 79
        Height = 12
        AutoSize = False
        Caption = 'Cancelado'
        WordWrap = True
      end
    end
  end
  inherited Dock971: TDock97 [23]
    Top = 401
    Width = 761
    inherited tb97Fundo: TToolbar97
      Left = 591
      DockPos = 591
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 423
      DockPos = 423
    end
  end
  inherited grpResultado: TGroupBox [24]
    Top = 228
    Width = 761
    Height = 173
    inherited pnlResult: TPanel
      Width = 757
      Height = 153
      object lstTeste: TListBox
        Left = 0
        Top = 0
        Width = 766
        Height = 162
        ItemHeight = 13
        TabOrder = 1
      end
      object dbgrdResultado: TwwDBGrid
        Left = 0
        Top = 0
        Width = 757
        Height = 153
        Hint = 'Clique com botão direito para ver opções de cancelamento'
        Selected.Strings = (
          'NOME'#9'40'#9'Participante'
          'MATRICULA'#9'10'#9'Matrícula'
          'INSCRICAONUMERO'#9'10'#9'Insc. Prev.'
          'NOMEPLANO'#9'40'#9'Plano Assistencial'
          'DATAENTRADA'#9'10'#9'Entrada'
          'DESCSITUACAO'#9'15'#9'Situação'
          'FLGPARTBENEF'#9'1'#9'Beneficiário?'
          'FLGINSCRICAOCANC'#9'10'#9'Cancelada?'
          'DATACANCELAMENTO'#9'10'#9'Cancelamento'
          'OBSCANCEL'#9'200'#9'Obs. Cancelamento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        MultiSelectOptions = [msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        PopupMenu = pmnu
        ShowHint = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbgrdResultadoCalcCellColors
        IndicatorColor = icBlack
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 699
    Top = 339
  end
  inherited qryPatro: TwwQuery
    SQL.Strings = (
      'SELECT   IDPESSOA,NOME'
      'FROM     PESSOA'
      'WHERE    (FLGPATROCINADORA = 1)'
      'ORDER BY NOME')
    Left = 429
    Top = 48
  end
  inherited qryPlano: TwwQuery
    SQL.Strings = (
      
        'SELECT   IDREGRACANCDESC,IDTETOSALPART,PATROLIMITE,RESULTLIMITE,' +
        'FLGCALCULALIMITE,'
      
        '         NUMINSCINICIAL,DIACOBRANCA,FLGMESCOBRANCA,IDREGRAATRASO' +
        'COR,'
      
        '         IDREGRAATRASOJUR,IDREGRADEVOLJUROS,IDREGRADEVOLCORR,FLG' +
        'RECALCCONTRIB,'
      
        '         IDREGRATRANSFPLA,FLGUSASALARIO,DATAAPURAEXCED,DATALIBER' +
        'AEXCED,'
      
        '         FLGEXCEDANIVERSA,IDPLANOPREV,RECPAGIRRF,IDFAVORECIDOIRR' +
        'F,RECPAG,'
      
        '         IDEMPRESAPROPIRRF,IDEMPRESAPROP,CODTIPRECDESIRRF,CODTIP' +
        'RECDES,'
      
        '         IDREGRACOBATRASO,TIPCODIGOIRRF,CODPORTFORMAIRRF,IDFUNDA' +
        'CAO,'
      
        '         UNIDNEGOCIOIRRF,CODCENTRESPIRRF,CODSUBCONTAIRRF,CODTIPD' +
        'OCIRRF,CODTIPDOC,'
      
        '         CODCENTCUSTDIRRF,INDICEREAJCONTRIB,IDPLANOCOM,IDEMPRESA' +
        'IRRF,'
      
        '         CODCENTCUSTCIRRF,IDREGRACANCELAME,NOME,PLACONTADIRRF,ID' +
        'REGRAADMISSAO,'
      
        '         PLANOIRRF,PLACONTACIRRF,IDREGRADESISTENC,IDREGRAREAJCON' +
        'TR,MESREAJCONTRIB,'
      '         IDTPREAJCONTRIB,TPPLANOPREV,FLGAUTONUMINSC'
      'FROM     PLANPREV'
      'ORDER BY NOME')
    Left = 624
    Top = 204
  end
  inherited qrySitPart: TwwQuery
    SQL.Strings = (
      'SELECT   IDSITPLANOASS IDSITPART,DESCRICAO'
      'FROM     SITPLANOASS'
      'ORDER BY DESCRICAO')
    Left = 564
    Top = 240
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 58
    Top = 313
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PA.IDPESSJUR,PA.SEQPROPOSTA,PA.IDPLANOPREV,'
      ' PA.IDPESSOA,PA.IDPLANASS,PA.IDSITPART,'
      ' PA.DATAENTRADA,PA.FLGINSCRICAOCANC,PA.INSCRICAONUMERO,'
      ' PA.DATACANCELAMENTO,PA.INSCRICAOTIPO,PA.OBSCANCEL,'
      ' PA.FLGPARTBENEF,PESSOA.NOME,PESSOA.NUMDOCUMENTO CPF,'
      ' EP.MATRICULA,EP.DATAADMISSAO,PL.IDREGRADESISTENC,'
      ' PL.NOME NOMEPLANO,PL.IDREGRACANCELAME,'
      ' P2.NOME NOMEPATRO,PR.NOME NOMEPLANPREV,'
      ' SITPART.DESCRICAO DESCSITUACAO,SITPART.DESCRICAO,'
      ' SITPART.FLGINTERNO'
      'FROM'
      ' ELEGPATRO EP, PARTASS PA, PESSOA, PLANASS PL,'
      ' SITPLANOASS SITPART, PESSOA P2, PLANPREV PR,'
      ' PARTPREVPLAN PREV'
      'WHERE'
      ' (PA.IDPESSJUR = P2.IDPESSOA) AND'
      ' (P2.IDPESSOA = EP.IDPESSJUR) AND'
      ' (EP.IDPESSJUR = PA.IDPESSJUR) AND'
      ' (EP.IDPESSOA = PESSOA.IDPESSOA) AND'
      ' (PL.IDPLANASS = PA.IDPLANASS) AND'
      ' (SITPART.IDSITPLANOASS = PA.IDSITPART) AND'
      ' (PA.IDPLANOPREV = PR.IDPLANOPREV) AND'
      ' (PA.IDPESSOA = EP.IDPESSOA) AND'
      ' (PA.IDPESSOA = PREV.IDPESSOA) AND'
      ' (PA.IDPLANOPREV = PREV.IDPLANOPREV) AND'
      ' (PA.IDPESSJUR = PREV.IDPESSJUR)')
    ControlType.Strings = (
      'FLGPARTBENEF;CheckBox;1;0'
      'FLGINSCRICAOCANC;CheckBox;1;0')
    ValidateWithMask = True
    Left = 86
    Top = 313
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 334
    Top = 241
  end
  object pmnu: TPopupMenu
    OnPopup = pmnuPopup
    Left = 192
    Top = 352
    object mnuCancelar: TMenuItem
      Caption = 'Cancelar'
      Hint = 'Cancelar inscrição'
      object pmenCancelar: TMenuItem
        Caption = 'Por &Desistência'
        Hint = 'Cancela titular e dependentes do plano (por desistência)'
        OnClick = pmenCancelarClick
      end
      object pmenCancelIn: TMenuItem
        Caption = 'Por &Inadimplência'
        Hint = 'Cancela titular e dependentes do plano (por inadimplência)'
        OnClick = pmenCancelInClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuBeneficiario: TMenuItem
        Caption = 'Titular como &Beneficiário'
        Hint = 
          'Cancela somente titular como beneficiário, mas mantém dependente' +
          's inscritos'
        OnClick = mnuBeneficiarioClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object pmemTransferencia: TMenuItem
        Caption = 'Transferência de Plano'
      end
    end
  end
  object qryPlanAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   IDREGRAADMISSAO,IDREGRAPAGAMENTO,IDREGRABENEFICIA,IDREG' +
        'RACANCELAME,'
      
        '         IDREGRADESISTENC,IDREGRACOMISSAO,NUMCONTRATO,DATAINICIO' +
        'VIGENC,'
      
        '         DATAINICIOCOM,CODTIPRECHISTPAG,CODTIPODOCHISTREC,IDREGR' +
        'AATRASOCOR,'
      
        '         IDREGRADEVOLJUROS,IDREGRADEVOLCORR,IDPLANASS,IDPESSOA,I' +
        'DREGRAATRASOJUR,'
      
        '         IDFORNSERV,CODPORTFORMA,CODTIPODOCHISTPAG,IDPRODASS,REC' +
        'PAGHISTPAG,NOME,'
      
        '         CODTIPORECHISTREC,IDREGRAADMINISTR,RECPAGHISTREC,FLGFEC' +
        'HADO,'
      '         IDREGRACOBRANCA,IDREGRAGERAL'
      'FROM     PLANASS'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 146
    Top = 247
  end
  object dsPlanAss: TwwDataSource
    DataSet = qryPlanAss
    Left = 194
    Top = 259
  end
  object RegraCancel: TRegra
    QueryIn = qryRegraCancel
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    Left = 506
    Top = 275
  end
  object qryRegraCancel: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT *'
      
        'FROM   HSTCONTRIBASS H,ELEGPATRO EL,PARTASS PT,PLANASS PL,PESSOA' +
        'FISICA PF,'
      '       PESSOA PE'
      'WHERE  (PE.IDPESSOA = :IDTITULAR)'
      'AND    (H.IDPLANASS = :IDPLANASS)'
      'AND    (H.IDPESSJUR =  :IDPESSJUR)'
      'AND    (H.IDPLANOPREV = :IDPLANOPREV)'
      'AND    (H.IDTITULAR = :IDTITULAR)'
      'AND    (EL.IDPESSOA = H.IDTITULAR)'
      'AND    (EL.IDPESSOA = PT.IDPESSOA)'
      'AND    (PT.IDPLANASS = H.IDPLANASS)'
      'AND    (EL.IDPESSJUR = H.IDPESSJUR)'
      'AND    (PT.IDPLANOPREV = H.IDPLANOPREV)'
      'AND    (PT.IDPLANASS =  H.IDPLANASS)'
      'AND    (PF.IDPESSOA = PT.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 453
    Top = 215
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object sldlgProcPart: TcmSelectDlg
    SearchControls = True
    Caption = 'Procura de Participante'
    DataSet = qry
    FieldNames.Strings = (
      'NOME'
      'CPF'
      'MATRICULA'
      'DATAADMISSAO'
      'NOMEPLANO'
      'NOME'
      'NOME'
      'DESCRICAO')
    DisplayLabels.Strings = (
      'Titular'
      'CPF'
      'Matrícula'
      'Data de Admissão'
      'Plano Assistencial'
      'Patrocinadora'
      'Plano Previdenciário'
      'Situaçao')
    AlwaysShow = True
    HelpContext = 0
    Left = 421
    Top = 264
  end
  object qryFilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' P.IDPESSOA, P.NOME '
      'FROM'
      ' PESSOA P, FILIALPESSOA FP'
      'WHERE'
      ' (P.IDPESSOA = FP.IDFILIALPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 274
    Top = 286
  end
end
