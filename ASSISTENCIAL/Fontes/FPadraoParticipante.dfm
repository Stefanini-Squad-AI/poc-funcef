inherited frmPadraoParticipante: TfrmPadraoParticipante
  Top = 9
  Caption = 'Formulário Padrão para Consultas que envolvam Participantes'
  ClientHeight = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 227
    Height = 178
  end
  inherited Dock971: TDock97
    Top = 405
    inherited TB97oKCancelar: TToolbar97
      Left = 270
      DockPos = 270
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited grpResultado: TGroupBox
    Top = 227
    Height = 178
    inherited pnlResult: TPanel
      Height = 158
    end
  end
  inherited pnlConsultar: TPanel
    Height = 227
    inherited anmLupa: TAnimate
      Left = 605
      Top = 155
    end
    inherited bbtnConsultar: TButton
      Left = 657
      Top = 174
    end
    inherited pgctrlConsulta: TPageControl
      Width = 595
      Height = 214
      inherited tbsPrincipal: TTabSheet
        object GroupBox1: TGroupBox
          Left = 3
          Top = 3
          Width = 241
          Height = 91
          TabOrder = 0
          object LABEL1: TLabel
            Left = 6
            Top = 12
            Width = 66
            Height = 13
            Caption = 'Patrocinadora'
          end
          object label4: TLabel
            Left = 6
            Top = 51
            Width = 27
            Height = 13
            Caption = 'Plano'
          end
          object dblkpcmbPatro: TwwDBLookupCombo
            Left = 6
            Top = 27
            Width = 229
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Patrocinadora')
            LookupTable = qryPatro
            LookupField = 'NOME'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dblkpcmbPlano: TwwDBLookupCombo
            Left = 6
            Top = 64
            Width = 229
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano')
            LookupTable = qryPlano
            LookupField = 'NOME'
            Options = [loTitles]
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object GroupBox5: TGroupBox
          Left = 251
          Top = 3
          Width = 332
          Height = 93
          Caption = 'Inscrição'
          TabOrder = 1
          object Label8: TLabel
            Left = 6
            Top = 15
            Width = 37
            Height = 13
            Caption = 'Número'
          end
          object Label9: TLabel
            Left = 135
            Top = 15
            Width = 23
            Height = 13
            Caption = 'Data'
          end
          object Label2: TLabel
            Left = 6
            Top = 53
            Width = 116
            Height = 13
            Caption = 'Situação do Participante'
          end
          object edNumInsc: TEdit
            Left = 6
            Top = 27
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object dblkpcmbSituacao: TwwDBLookupCombo
            Left = 6
            Top = 66
            Width = 250
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Situação do Participante')
            LookupTable = qrySitPart
            LookupField = 'DESCRICAO'
            Options = [loTitles]
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object mskdlgDataInsc: TCMDateTimePicker
            Left = 135
            Top = 27
            Width = 97
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
            TabOrder = 2
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 4
          Top = 99
          Width = 240
          Height = 67
          Caption = 'Participante'
          Items.Strings = (
            'Assistido'
            'Contribuinte'
            'Todos')
          TabOrder = 2
        end
        object rgrpStatusInsc: TRadioGroup
          Left = 251
          Top = 99
          Width = 332
          Height = 67
          Caption = 'Situação da Inscrição'
          Columns = 2
          Items.Strings = (
            'Normal'
            'Cancelada por Inadimplência'
            'Suspensa'
            'Cancelada por Desistência')
          TabOrder = 3
        end
      end
      inherited tbsAvancada: TTabSheet
        inherited lstTabelas: TListBox
          Height = 181
          Items.Strings = (
            'Participante'
            'Dependente'
            'Beneficiário'
            'Contribuição'
            'Benefício')
          OnClick = lstTabelasClick
        end
        inherited pnlPesqAvanc: TPanel
          Left = 135
          Width = 448
          Height = 181
          inherited sbtnOU: TSpeedButton
            Left = 207
            Top = 62
          end
          inherited sbtnE: TSpeedButton
            Left = 207
            Top = 27
          end
          inherited sbtnApagar: TSpeedButton
            Left = 207
            Top = 96
          end
          inherited rgrpSinal: TRadioGroup
            Width = 193
          end
          inherited lstCampo: TListBox
            Width = 193
          end
          inherited edConteudo: TEdit
            Left = 9
            Width = 190
          end
          inherited lstResult: TListBox
            Left = 237
          end
          object rgrpSexo: TRadioGroup
            Left = 6
            Top = 135
            Width = 151
            Height = 33
            Columns = 2
            Items.Strings = (
              'Fem.'
              'Masc.')
            TabOrder = 4
          end
          object rgrpFlag: TRadioGroup
            Left = 105
            Top = 138
            Width = 151
            Height = 33
            Columns = 2
            Items.Strings = (
              'Verdadeiro'
              'Falso')
            TabOrder = 5
          end
          object rgrpEstCivil: TRadioGroup
            Left = 201
            Top = 135
            Width = 151
            Height = 43
            Columns = 2
            Items.Strings = (
              'Solteiro'
              'Casado'
              'Viúvo'
              'Divorciado')
            TabOrder = 6
          end
          object mskedMes: TcmMaskEditDlg
            Left = 177
            Top = 148
            Width = 88
            Height = 21
            EditMask = '!9999/99;1;_'
            MaxLength = 7
            TabOrder = 7
            Text = '    /  '
            BtnNumGlyphs = 1
            BtnWidth = 17
          end
          object mskedData: TCMDateTimePicker
            Left = 168
            Top = 156
            Width = 97
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
            TabOrder = 8
          end
        end
      end
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,NOME'
      'FROM   PESSOA'
      'WHERE  (FLGPATROCINADORA = 1)'
      '')
    ValidateWithMask = True
    Left = 704
    Top = 76
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDREGRACANCDESC,IDTETOSALPART,PATROLIMITE,RESULTLIMITE,FL' +
        'GCALCULALIMITE,'
      
        '       NUMINSCINICIAL,DIACOBRANCA,FLGMESCOBRANCA,IDREGRAATRASOCO' +
        'R,'
      
        '       IDREGRAATRASOJUR,IDREGRADEVOLJUROS,IDREGRADEVOLCORR,FLGRE' +
        'CALCCONTRIB,'
      
        '       IDREGRATRANSFPLA,FLGUSASALARIO,DATAAPURAEXCED,DATALIBERAE' +
        'XCED,'
      
        '       FLGEXCEDANIVERSA,IDPLANOPREV,RECPAGIRRF,IDFAVORECIDOIRRF,' +
        'RECPAG,'
      
        '       IDEMPRESAPROPIRRF,IDEMPRESAPROP,CODTIPRECDESIRRF,CODTIPRE' +
        'CDES,'
      
        '       IDREGRACOBATRASO,TIPCODIGOIRRF,CODPORTFORMAIRRF,IDFUNDACA' +
        'O,'
      
        '       UNIDNEGOCIOIRRF,CODCENTRESPIRRF,CODSUBCONTAIRRF,CODTIPDOC' +
        'IRRF,CODTIPDOC,'
      
        '       CODCENTCUSTDIRRF,INDICEREAJCONTRIB,IDPLANOCOM,IDEMPRESAIR' +
        'RF,'
      
        '       CODCENTCUSTCIRRF,IDREGRACANCELAME,NOME,PLACONTADIRRF,IDRE' +
        'GRAADMISSAO,'
      
        '       PLANOIRRF,PLACONTACIRRF,IDREGRADESISTENC,IDREGRAREAJCONTR' +
        ',MESREAJCONTRIB,'
      '       IDTPREAJCONTRIB,TPPLANOPREV,FLGAUTONUMINSC'
      'FROM   PLANPREV')
    ValidateWithMask = True
    Left = 704
    Top = 19
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOPREV IDSITPART,DESCRICAO,FLGINTERNO'
      'FROM   SITPLANOPREV')
    ValidateWithMask = True
    Left = 701
    Top = 133
  end
end
