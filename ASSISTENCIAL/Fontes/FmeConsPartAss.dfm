object FrameConsPartAss: TFrameConsPartAss
  Left = 0
  Top = 0
  Width = 792
  Height = 403
  TabOrder = 0
  OnEnter = FrameEnter
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 403
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object pcBenef: TPageControl
      Left = 1
      Top = 223
      Width = 790
      Height = 179
      ActivePage = tsBenef
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tsBenef: TTabSheet
        Caption = 'Beneficiários Assistenciais Ativos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 353
          Height = 151
          Align = alLeft
          DataSource = dsBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 320
              Visible = True
            end>
        end
        object gbDetalhes: TGroupBox
          Left = 360
          Top = 0
          Width = 409
          Height = 145
          TabOrder = 1
          object Label15: TLabel
            Left = 8
            Top = 22
            Width = 82
            Height = 13
            Caption = 'Data Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText14: TDBText
            Left = 8
            Top = 38
            Width = 81
            Height = 17
            DataField = 'DATANASC'
            DataSource = dsBenef
          end
          object Label16: TLabel
            Left = 112
            Top = 22
            Width = 27
            Height = 13
            Caption = 'Idade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText15: TDBText
            Left = 112
            Top = 38
            Width = 25
            Height = 17
            DataField = 'IDADE'
            DataSource = dsBenef
          end
          object DBText16: TDBText
            Left = 304
            Top = 38
            Width = 100
            Height = 17
            DataField = 'ESTCIVIL'
            DataSource = dsBenef
          end
          object Label17: TLabel
            Left = 304
            Top = 22
            Width = 55
            Height = 13
            Caption = 'Estado Civil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 8
            Top = 62
            Width = 82
            Height = 13
            Caption = 'Tipo Depedencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText17: TDBText
            Left = 8
            Top = 78
            Width = 97
            Height = 17
            DataField = 'DEPENDENCIA'
            DataSource = dsBenef
          end
          object Label19: TLabel
            Left = 168
            Top = 22
            Width = 52
            Height = 13
            Caption = 'Dep. Legal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText18: TDBText
            Left = 168
            Top = 38
            Width = 81
            Height = 17
            DataField = 'LEGAL'
            DataSource = dsBenef
          end
          object Label20: TLabel
            Left = 8
            Top = 102
            Width = 109
            Height = 13
            Caption = 'Situação Dependencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText19: TDBText
            Left = 8
            Top = 118
            Width = 191
            Height = 17
            DataField = 'DEPENDENTE'
            DataSource = dsBenef
          end
          object Label21: TLabel
            Left = 168
            Top = 62
            Width = 63
            Height = 13
            Caption = 'Data Entrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText20: TDBText
            Left = 168
            Top = 78
            Width = 73
            Height = 17
            DataField = 'DATAENTRADA'
            DataSource = dsBenef
          end
          object Label34: TLabel
            Left = 256
            Top = 22
            Width = 24
            Height = 13
            Caption = 'Sexo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText33: TDBText
            Left = 256
            Top = 38
            Width = 25
            Height = 17
            DataField = 'SEXO'
            DataSource = dsBenef
          end
        end
      end
      object tsCancel: TTabSheet
        Caption = 'Beneficiários Assistenciais Cancelados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 353
          Height = 151
          Align = alLeft
          DataSource = dsBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 320
              Visible = True
            end>
        end
        object gbDetalhes1: TGroupBox
          Left = 360
          Top = 0
          Width = 409
          Height = 145
          Caption = 'gbDetalhes'
          TabOrder = 1
          object Label8: TLabel
            Left = 8
            Top = 22
            Width = 82
            Height = 13
            Caption = 'Data Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText9: TDBText
            Left = 8
            Top = 38
            Width = 85
            Height = 17
            DataField = 'DATANASC'
            DataSource = dsBenef
          end
          object Label13: TLabel
            Left = 112
            Top = 22
            Width = 27
            Height = 13
            Caption = 'Idade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText12: TDBText
            Left = 112
            Top = 38
            Width = 47
            Height = 17
            DataField = 'IDADE'
            DataSource = dsBenef
          end
          object DBText13: TDBText
            Left = 304
            Top = 38
            Width = 92
            Height = 17
            DataField = 'ESTCIVIL'
            DataSource = dsBenef
          end
          object Label14: TLabel
            Left = 304
            Top = 22
            Width = 55
            Height = 13
            Caption = 'Estado Civil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 8
            Top = 62
            Width = 82
            Height = 13
            Caption = 'Tipo Depedencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText23: TDBText
            Left = 8
            Top = 78
            Width = 123
            Height = 17
            DataField = 'DEPENDENCIA'
            DataSource = dsBenef
          end
          object Label25: TLabel
            Left = 168
            Top = 22
            Width = 52
            Height = 13
            Caption = 'Dep. Legal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText24: TDBText
            Left = 168
            Top = 38
            Width = 79
            Height = 17
            DataField = 'LEGAL'
            DataSource = dsBenef
          end
          object Label26: TLabel
            Left = 8
            Top = 102
            Width = 109
            Height = 13
            Caption = 'Situação Dependencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText25: TDBText
            Left = 8
            Top = 118
            Width = 177
            Height = 17
            DataField = 'DEPENDENTE'
            DataSource = dsBenef
          end
          object Label28: TLabel
            Left = 144
            Top = 62
            Width = 63
            Height = 13
            Caption = 'Data Entrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText26: TDBText
            Left = 144
            Top = 78
            Width = 89
            Height = 17
            DataField = 'DATAENTRADA'
            DataSource = dsBenef
          end
          object Label29: TLabel
            Left = 304
            Top = 62
            Width = 94
            Height = 13
            Caption = 'Data Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText27: TDBText
            Left = 309
            Top = 78
            Width = 80
            Height = 17
            DataField = 'DTCANCELAMENTO'
            DataSource = dsBenef
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 256
            Top = 22
            Width = 24
            Height = 13
            Caption = 'Sexo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText28: TDBText
            Left = 256
            Top = 38
            Width = 41
            Height = 17
            DataField = 'SEXO'
            DataSource = dsBenef
          end
          object Label32: TLabel
            Left = 192
            Top = 94
            Width = 103
            Height = 13
            Caption = 'Motivo Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText31: TDBText
            Left = 194
            Top = 109
            Width = 207
            Height = 31
            DataField = 'OBSCANCEL'
            DataSource = dsBenef
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Histórico de Planos Assistenciais do Participante'
        ImageIndex = 2
        object gbHistPlano: TGroupBox
          Left = 0
          Top = 0
          Width = 782
          Height = 151
          Align = alClient
          Caption = 'Planos Assistenciais Anteriores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object wwDBGrid1: TwwDBGrid
            Left = 2
            Top = 15
            Width = 778
            Height = 134
            Selected.Strings = (
              'PLANO'#9'35'#9'Descrição do Plano'
              'DATAENTRADA'#9'18'#9'Data de Entrada '
              'FORMA_PAGAMENTO'#9'15'#9'Forma de Pagamento'
              'DATACANCELAMENTO'#9'18'#9'Data de Cancelamento '
              'COBDIF'#9'3'#9'Cobrança Diferenciada'
              'CONTRIBUICAO'#9'35'#9'Descrição da Cobrança'#9'F'
              'PLANOPREV'#9'35'#9'Plano Previdenciário'
              'OBSCANCEL'#9'200'#9'Observação do Cancelamento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsHistPlano
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
    end
    object pcPart: TPageControl
      Left = 1
      Top = 1
      Width = 790
      Height = 88
      ActivePage = tsPrincipal
      Align = alTop
      PopupMenu = pmAtalho
      TabOrder = 1
      object tsPrincipal: TTabSheet
        Caption = 'Dados Principais'
        object Label2: TLabel
          Left = 8
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Matricula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 88
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 160
          Top = 24
          Width = 69
          Height = 13
          Caption = 'Data Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 112
          Top = 8
          Width = 50
          Height = 13
          AutoSize = True
          DataField = 'NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 8
          Top = 40
          Width = 72
          Height = 13
          DataField = 'MATRICULA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 544
          Top = 8
          Width = 50
          Height = 13
          AutoSize = True
          DataField = 'NOME_FALECIDO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblTitular: TLabel
          Left = 416
          Top = 8
          Width = 125
          Height = 13
          Caption = 'Participante Falecido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object DBText4: TDBText
          Left = 88
          Top = 40
          Width = 67
          Height = 13
          DataField = 'INSCRICAONUMERO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 160
          Top = 40
          Width = 69
          Height = 13
          DataField = 'INSCRICAODATA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 236
          Top = 24
          Width = 66
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText6: TDBText
          Left = 236
          Top = 40
          Width = 124
          Height = 13
          DataField = 'PATROCINADORA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText7: TDBText
          Left = 368
          Top = 40
          Width = 168
          Height = 13
          DataField = 'PREVIDENCIARIO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 368
          Top = 24
          Width = 97
          Height = 13
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 8
          Width = 95
          Height = 13
          Caption = 'PARTICIPANTE:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 543
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Est.Civil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText8: TDBText
          Left = 543
          Top = 40
          Width = 72
          Height = 13
          DataField = 'ESTCIVIL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 616
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 750
          Top = 24
          Width = 24
          Height = 13
          Caption = 'Sexo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText10: TDBText
          Left = 749
          Top = 40
          Width = 25
          Height = 13
          Alignment = taCenter
          DataField = 'SEXO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblData: TLabel
          Left = 616
          Top = 40
          Width = 5
          Height = 13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object tsGeral: TTabSheet
        Caption = 'Dados Gerais'
        object Label23: TLabel
          Left = 8
          Top = 46
          Width = 49
          Height = 13
          Caption = 'Endereço:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText22: TDBText
          Left = 64
          Top = 46
          Width = 705
          Height = 13
          DataField = 'ENDERECO'
          DataSource = ds
        end
        object Label12: TLabel
          Left = 8
          Top = 25
          Width = 109
          Height = 13
          Caption = 'Tipo de Dependencia: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText11: TDBText
          Left = 117
          Top = 25
          Width = 76
          Height = 13
          DataField = 'DEPENDENCIA'
          DataSource = ds
        end
        object Label27: TLabel
          Left = 467
          Top = 25
          Width = 31
          Height = 13
          Caption = 'Conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblConta: TLabel
          Left = 502
          Top = 25
          Width = 269
          Height = 13
          AutoSize = False
          Caption = 'Conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 8
          Top = 4
          Width = 95
          Height = 13
          Caption = 'PARTICIPANTE:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText21: TDBText
          Left = 112
          Top = 4
          Width = 57
          Height = 13
          AutoSize = True
          DataField = 'NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTitular2: TLabel
          Left = 467
          Top = 4
          Width = 102
          Height = 13
          Caption = 'Participante Falecido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object DBText29: TDBText
          Left = 601
          Top = 4
          Width = 163
          Height = 13
          DataField = 'NOME_FALECIDO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText30: TDBText
          Left = 250
          Top = 25
          Width = 212
          Height = 13
          DataField = 'SITUACAO'
          DataSource = ds
        end
        object Label31: TLabel
          Left = 200
          Top = 25
          Width = 50
          Height = 13
          AutoSize = False
          Caption = 'Situação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object pcPlano: TPageControl
      Left = 1
      Top = 89
      Width = 790
      Height = 134
      ActivePage = tsPlano
      Align = alClient
      TabOrder = 2
      object tsPlano: TTabSheet
        Caption = 'Planos e Contribuições Assistenciais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object dbgPlano: TDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 106
          Align = alClient
          DataSource = dsPlano
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'PLANO'
              Title.Caption = 'Plano Assitencial'
              Width = 199
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAENTRADA'
              Title.Caption = 'Data de Entrada'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATACANCELAMENTO'
              Title.Caption = 'Data Cancelamento'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTRIBUICAO'
              Title.Caption = 'Contribuição'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMA_PAGAMENTO'
              Title.Caption = 'Forma de Pagamento'
              Width = 205
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COBDIF'
              Title.Caption = 'Cobrança Diferenciada'
              Width = 140
              Visible = True
            end>
        end
      end
      object tsInfPlano: TTabSheet
        Caption = 'Informações Específicas do Plano Selecionado'
        ImageIndex = 1
        object DbgInfPlano: TDBGrid
          Left = 0
          Top = 17
          Width = 620
          Height = 78
          Align = alLeft
          DataSource = DsInfPlano
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPOSEG'
              Title.Caption = 'Tipo Segurado'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPITALMN'
              Title.Caption = 'Capital MN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPITALIP'
              Title.Caption = 'Capital IP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPITALMA'
              Title.Caption = 'Capital MA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREMIOFXA'
              Title.Caption = 'Prêmio FxA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREMIOFXB'
              Title.Caption = 'Prêmio FxB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREMIOFXC'
              Title.Caption = 'Prêmio FxC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREMIOFXD'
              Title.Caption = 'Prêmio FxD'
              Visible = True
            end>
        end
        object GroupBox1: TGroupBox
          Left = 620
          Top = 17
          Width = 149
          Height = 78
          Align = alLeft
          Caption = 'Valor da Mensalidade'
          TabOrder = 1
          object LbValor: TLabel
            Left = 17
            Top = 29
            Width = 98
            Height = 13
            Caption = 'Valor Calculado: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnlDescPlano: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 17
          Align = alTop
          Alignment = taLeftJustify
          Caption = '  Descrição do Plano'
          TabOrder = 2
        end
      end
    end
  end
  object ivTradutor: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 627
    Top = 4
    TargetsData = (
      1
      2
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0))
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 48
    Top = 206
  end
  object upd: TUpdateSQL
    Left = 587
    Top = 206
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PV.INSCRICAONUMERO'
      'PE.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição'
      'Nome'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA       PE'
      'ELEGPATRO    EL'
      'PARTPREVPLAN PV'
      'PARTASS      PA'
      'PLANPREV     PL'
      'NUCLEOFAMASS NF')
    CamposChave.Strings = (
      'EL.IDPESSOA'
      'PE.IDPESSOA')
    Filtro.Strings = (
      'PE.IDPESSOA = NVL(NF.IDRESPONSAVEL,PE.IDPESSOA)'
      'PE.IDPESSOA = EL.IDPESSOA'
      'PV.IDPESSOA = EL.IDPESSOA'
      'PV.IDPESSJUR = PA.IDPESSJUR'
      'PV.IDSITPART = PV.IDSITPART'
      'PA.SEQPROPOSTA = PA.SEQPROPOSTA'
      'PA.IDPLANOPREV = PL.IDPLANOPREV'
      'PA.IDPLANASS = PA.IDPLANASS'
      'PA.IDPESSOA = PV.IDPESSOA'
      'PA.IDPESSOA = NF.IDTITULAR(+)'
      'PE.IDPESSOA NOT IN (SELECT IDTITULAR FROM NUCLEOFAMASS)'
      'PV.IDPLANOPREV = PA.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '11'
      '10'
      '35'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 312
    Top = 44
  end
  object ImlPadrao: TImageList
    Left = 665
    Top = 4
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object CmeCadastro: TCmEventosCadastro
    Operacao = opIdle
    RepetirInsert = True
    DataSource = ds
    OpenDsAutomatico = False
    Left = 708
    Top = 4
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPESSOA AS CHAVE,'
      '   PV.INSCRICAONUMERO,'
      '   EL.MATRICULA,'
      '   PV.INSCRICAODATA,'
      '   SP.DESCRICAO AS SITUACAO,'
      '   PE.NOME,'
      '   PF.DATANASC,'
      '   TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'
      '   PF.SEXO,'
      '   DECODE(PF.ESTCIVIL,'#39'S'#39','#39'SOLTEIRO(A)'#39','
      '                      '#39'C'#39','#39'CASADO(A)'#39','
      '                      '#39'D'#39','#39'DIVORCIADO(A)'#39','
      '                      '#39'V'#39','#39'VIÚVO(A)'#39','
      '                      '#39'O'#39','#39'OUTROS'#39') AS ESTCIVIL,'
      '   PJ.NOME AS PATROCINADORA,'
      '   SD.DESCRICAO AS DEPENDENTE,'
      '   DP.DESCRICAO AS DEPENDENCIA,'
      '   DECODE(FLGDEPLEGAL, 0, '#39'NÃO'#39','
      '                       1, '#39'SIM'#39','
      '                    NULL, '#39'AGREGADO'#39') AS LEGAL,'
      
        '   DECODE(PA.OPCAOA,'#39'1'#39','#39'COM COBRANÇA DIFERENCIADA'#39','#39'SEM COBRANÇ' +
        'A DIFERENCIADA'#39') AS COBDIF,'
      ''
      '   PL.IDPLANOPREV,'
      '   PL.NOME PREVIDENCIARIO,'
      '   PN.NOME NOME_FALECIDO,'
      
        '   RTRIM(EP.LOGRADOURO) ||'#39' '#39'|| RTRIM(EP.NUMERO) ||'#39' '#39'|| RTRIM(E' +
        'P.COMPLEMENTO) ||'#39' '#39'|| RTRIM(EP.BAIRRO) ||'#39' '#39'|| RTRIM(EP.CIDADE)' +
        ' ||'#39' '#39'|| RTRIM(EP.CODESTADO) ||'#39' CEP: '#39'|| RTRIM(EP.CEP) AS ENDER' +
        'ECO,'
      
        '   '#39'BANCO Nº'#39'||RTRIM(BC.NUMBANCO) ||'#39' Ag.'#39'|| RTRIM(AB.NUMAGENCIA' +
        ') ||'#39' - C/C '#39'|| CB.CONTACORRENTE AS CONTA'
      ''
      'FROM'
      '   PESSOA          PE,   /* PESSOA PARTICIPANTE */'
      '   PESSOA          PN,   /* PESSOA PENSIONISTA  */'
      '   PESSOA          PJ,   /* PESSOA JURIDICA     */'
      '   PESSOA          PB,   /* PESSOA BANCO        */'
      '   PESSOAFISICA    PF,'
      '   DEPENTIT        DT,'
      '   DEPENDENTE      DE,'
      '   ELEGPATRO       EL,'
      '   ENDPESS         EP,'
      '   PARTPREVPLAN    PV,'
      '   PARTASS         PA,'
      '   CONTABANCARIA   CB,'
      '   AGENCIABANCARIA AB,'
      ' --  CIDADES         CD,'
      '   BANCO           BC,'
      '   NUCLEOFAMASS    NF,'
      '--   ESTADO          UF,'
      '   DEPEN           DP,'
      '   SITDEPENDENTE   SD,'
      '   SITPART         SP,'
      '   PLANPREV        PL'
      ''
      'WHERE'
      '   (PE.IDPESSOA    = :IDPESSOA)                     AND'
      ''
      '   (PE.IDPESSOA = NF.IDTITULAR(+))                  AND'
      ''
      '   (PN.IDPESSOA(+) =  NF.IDTITULAR)                 AND'
      ''
      '   (PJ.IDPESSOA = PV.IDPESSJUR)                     AND'
      ''
      '   (PF.IDPESSOA    = NVL(NF.IDTITULAR,PE.IDPESSOA)) AND'
      ''
      '  -- (PF.DATAMORTE IS NULL)                           AND'
      ''
      '   (DT.IDPESSOA    = PE.IDPESSOA)                   AND'
      ''
      '   (DT.IDTITULAR   = PA.IDPESSOA)                   AND'
      ''
      '   (DT.IDDEPENDENCIA = DP.IDDEPENDENCIA)            AND'
      ''
      '   (DE.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+))     AND'
      ''
      '   (DE.IDPESSOA    = PE.IDPESSOA)                   AND'
      ''
      '   (PA.IDPESSOA    = PE.IDPESSOA)                   AND'
      
        '--   (PA.FLGINSCRICAOCANC=0) AND                          /* FER' +
        'NANDO - REFER - 14/05/2004 */'
      ''
      ''
      '   (EL.IDPESSOA    = DT.IDTITULAR)                  AND'
      '   (EL.IDPESSJUR   = PV.IDPESSJUR)                  AND'
      ''
      '   (PE.IDPESSOA         = EP.IDPESSOA(+))           AND'
      
        '   (PE.IDENDCORRESP = EP.IDENDERECO(+))             AND    /* FE' +
        'RNANDO - REFER - 14/05/2004 */'
      ''
      '   (PV.IDPLANOPREV = PL.IDPLANOPREV)                AND'
      ''
      '   (PV.IDSITPART   = PV.IDSITPART)                  AND'
      '   (PV.IDPESSOA    = DT.IDTITULAR)                  AND'
      '   (PV.SEQPROPOSTA = PV.SEQPROPOSTA)                AND'
      ''
      '   (PV.FLGDESATIVADO = 0)                           AND'
      ''
      '   (CB.IDPESSOA(+) = PE.IDPESSOA)                   AND'
      '   (CB.FLGCONTAPREF(+) = 1)                         AND'
      ''
      '   (AB.IDPESSOA(+) = CB.IDAGENCIA)                  AND'
      ''
      '  -- (CD.IDCIDADES   =  EP.IDCIDADES)                 AND'
      '  -- (CD.IDESTADO    =  CD.IDESTADO)                  AND'
      ''
      '   (BC.IDPESSOA(+) = AB.IDBANCO)                    AND'
      ''
      '   (BC.IDPESSOA = PB.IDPESSOA(+))                   AND'
      ''
      '--   (UF.IDESTADO     = CD.IDESTADO)                  AND'
      ''
      '--  (UF.IDPAIS       = 1)                            AND'
      ''
      '   (PV.IDSITPART = SP.IDSITPART)                    AND'
      ''
      ''
      '   (NF.IDTITULAR(+)  = PE.IDPESSOA)                 AND'
      ''
      '   (NF.IDRESPONSAVEL = PN.IDPESSOA(+))              AND'
      ''
      '   (NVL(NF.IDTITULAR,PE.IDPESSOA) = EL.IDPESSOA)'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 19
    Top = 205
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCHAVE: TFloatField
      FieldName = 'CHAVE'
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 29
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryIDADE: TFloatField
      FieldName = 'IDADE'
    end
    object qrySEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object qryESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Size = 13
    end
    object qryPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 7
    end
    object qryDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 50
    end
    object qryDEPENDENCIA: TStringField
      FieldName = 'DEPENDENCIA'
      Size = 15
    end
    object qryLEGAL: TStringField
      FieldName = 'LEGAL'
      Size = 8
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPREVIDENCIARIO: TStringField
      FieldName = 'PREVIDENCIARIO'
      Size = 50
    end
    object qryINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
    end
    object qryNOME_FALECIDO: TStringField
      FieldName = 'NOME_FALECIDO'
      Size = 60
    end
    object qryENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 180
    end
    object qryCONTA: TStringField
      FieldName = 'CONTA'
      Size = 59
    end
    object qryCOBDIF: TStringField
      FieldName = 'COBDIF'
      Size = 25
    end
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 449
    Top = 204
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    PE.IDPESSOA,'
      '    PE.NOME,'
      '    BE.DATAENTRADA,'
      '    BE.DTCANCELAMENTO,'
      '    BE.OBSCANCEL,'
      '    PF.DATANASC,'
      '    TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'
      '    PF.SEXO,'
      '    DECODE(PF.ESTCIVIL,'#39'S'#39','#39'SOLTEIRO(A)'#39','
      '                       '#39'C'#39','#39'CASADO(A)'#39','
      '                       '#39'D'#39','#39'DIVORCIADO(A)'#39','
      '                       '#39'V'#39','#39'VIÚVO(A)'#39','
      '                       '#39'O'#39','#39'OUTROS'#39') AS ESTCIVIL,'
      '    SD.DESCRICAO AS DEPENDENTE,'
      '    DP.DESCRICAO AS DEPENDENCIA,'
      '    DECODE(FLGDEPLEGAL, 0, '#39'NÃO'#39','
      '                        1, '#39'SIM'#39','
      '                     NULL,'#39'AGREGADO'#39') AS LEGAL,'
      '    DECODE(BE.DTCANCELAMENTO, NULL, '#39'S'#39', '#39'N'#39') AS CAMPODATA'
      'FROM'
      '   PESSOA        PE,'
      '   PESSOAFISICA  PF,'
      '   DEPENDENTE    DE,'
      '   DEPENTIT      DT,'
      '   BENEFASS      BE,'
      '   DEPEN         DP,'
      '   SITDEPENDENTE SD'
      'WHERE'
      '--  FILTRO BENEFASS'
      '   (BE.IDTITULAR       =  :IDTITULAR)               AND'
      '   (BE.IDPLANASS       =  :IDPLANASS)               AND'
      ''
      '--  FILTRO PESSOA FISICA'
      '--   (PF.DATAMORTE IS NULL)                           AND'
      ''
      '--  JOIN PESSOAFISICA COM PESSOA'
      '   (PF.IDPESSOA        = PE.IDPESSOA)               AND'
      ''
      '--  JOIN DEPENDENTE COM PESSOA'
      '   (DE.IDPESSOA        = PE.IDPESSOA)               AND'
      ''
      '--  JOIN DEPENDENTE COM SITDEPENDENTE'
      '   (DE.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+))     AND'
      ''
      '--  JOIN DEPENTIT COM PESSOA'
      '   (DT.IDPESSOA        = PE.IDPESSOA)               AND'
      ''
      '--  JOIN DEPENTIT COM DEPENTIT'
      '   (DT.IDTITULAR       = BE.IDTITULAR)              AND'
      '   (DT.IDDEPENDENCIA   = DT.IDDEPENDENCIA)          AND'
      ''
      '--  JOIN DEPENTIT COM DEPEN'
      '   (DT.IDDEPENDENCIA   = DP.IDDEPENDENCIA)          AND'
      ''
      '--  JOIN BENEFASS COM PESSOA'
      '   (DT.IDPESSOA       = BE.IDDEPENDENTE)'
      '-- AND BE.IDTITULAR <> BE.IDDEPENDENTE  /* P.15472 */'
      'ORDER BY PE.IDPESSOA'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 680
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
    object qryBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBenefNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryBenefDATAENTRADA: TDateTimeField
      FieldName = 'DATAENTRADA'
    end
    object qryBenefDTCANCELAMENTO: TDateTimeField
      FieldName = 'DTCANCELAMENTO'
    end
    object qryBenefDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryBenefIDADE: TFloatField
      FieldName = 'IDADE'
    end
    object qryBenefSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object qryBenefESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Size = 13
    end
    object qryBenefDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 50
    end
    object qryBenefDEPENDENCIA: TStringField
      FieldName = 'DEPENDENCIA'
      Size = 15
    end
    object qryBenefLEGAL: TStringField
      FieldName = 'LEGAL'
      Size = 8
    end
    object qryBenefCAMPODATA: TStringField
      FieldName = 'CAMPODATA'
      Size = 1
    end
    object qryBenefOBSCANCEL: TStringField
      FieldName = 'OBSCANCEL'
      Size = 100
    end
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 728
    Top = 89
  end
  object pmAtalho: TPopupMenu
    Left = 498
    Top = 35
    object Participante1: TMenuItem
      Caption = 'Participante'
    end
    object Planos1: TMenuItem
      Caption = 'Planos'
      Enabled = False
    end
    object Beneficirios1: TMenuItem
      Caption = 'Beneficiários Assistenciais'
      Enabled = False
    end
  end
  object pmAtalhoAlt: TPopupMenu
    Left = 562
    Top = 43
    object MenuItem2: TMenuItem
      Caption = 'Planos'
      object PlanoInscrito1: TMenuItem
        Caption = 'Plano Inscrito'
      end
      object DatadeEntrada1: TMenuItem
        Caption = 'Data de Entrada'
      end
      object FormadePagamento1: TMenuItem
        Caption = 'Forma de Pagamento'
      end
      object Contribuio1: TMenuItem
        Caption = 'Tipo de Cobrança'
      end
      object DatadeCancelamento1: TMenuItem
        Caption = 'Data de Cancelamento'
      end
      object Cobranadiferenciada1: TMenuItem
        Caption = 'Cobrança diferenciada'
      end
    end
    object MenuItem3: TMenuItem
      Caption = 'Beneficiários Assistenciais'
      object DataEntrada1: TMenuItem
        Caption = 'Data Entrada'
      end
      object DataCancelamento1: TMenuItem
        Caption = 'Data Cancelamento'
      end
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   PE.IDPESSOA,'
      '   PA.INSCRICAONUMERO,'
      '   PA.IDPLANASS,'
      '   PA.IDPLANOPREV,'
      
        '   DECODE(BE.IDTITULAR,DECODE(BE.DTCANCELAMENTO,NULL,PE.IDPESSOA' +
        '),'#39'SIM'#39','#39'NÃO'#39') AS BENEFICIARIO,'
      '   UPPER(PN.NOME) AS PLANO,'
      '   PA.DATAENTRADA,'
      '   PA.DATACANCELAMENTO,'
      '   DECODE(PA.OPCAOA,'#39'1'#39','#39'SIM'#39','#39'NÃO'#39') AS COBDIF,'
      
        '   DECODE(CO.FLGCOBCARNE,1,'#39'BOLETO BANCÁRIO'#39','#39'FOLHA'#39') AS FORMA_P' +
        'AGAMENTO,'
      '   CO.IDCONTASS,'
      '   CT.NOME AS CONTRIBUICAO'
      'FROM'
      '   PESSOA        PE,'
      '   PARTPREVPLAN  PV,'
      '   CONTASS       CO,'
      '   BENEFASS      BE,'
      '   PARTASS       PA,'
      '   PORTADORFORMA PF,'
      '   PLANASS       PN,'
      '   CONTRIBUICAO  CT'
      'WHERE'
      '-- FILTRO PRINCIPAL DE MONTASELECT VEM DE ELEGPATRO'
      '   (PE.IDPESSOA     = :IDPESSOA)          AND'
      '   (PA.IDPLANOPREV  = :IDPLANOPREV) AND'
      ''
      '-- JOIN  PARTPREVPLAN COM PESSOA'
      '   (PE.IDPESSOA = PV.IDPESSOA) AND'
      ''
      '-- JOIN  PARTPREVPLAN COM PARTPREVPLAN'
      '   (PV.FLGDESATIVADO = 0) AND'
      ''
      '-- JOIN  PARTPREVPLAN COM PARTASS'
      '   (PV.IDPESSOA = PA.IDPESSOA) AND'
      '   (PV.IDPLANOPREV = PA.IDPLANOPREV) AND'
      ''
      '-- JOIN  CONTASS COM PARTASS'
      '   (CO.IDPLANASS     = PA.IDPLANASS)       AND'
      '   (CO.IDPLANOPREV   = PA.IDPLANOPREV)     AND'
      '   (CO.IDPESSJUR     = PA.IDPESSJUR)       AND'
      '-- JOIN CONTASS COM PESSOA'
      '   (CO.IDTITULAR     = PE.IDPESSOA)        AND'
      '-- JOIN CONTASS COM BENEFASS'
      '   (CO.IDDEPENDENTE  = BE.IDDEPENDENTE)    AND'
      '-- JOIN CONTASS COM CONTASS'
      '   (CO.IDCONTASS     = CO.IDCONTASS)       AND'
      '   (CO.SEQPROPOSTA   = CO.SEQPROPOSTA)     AND'
      
        '   (CO.FLGATIVO      = 1)                  AND  /* fernando - p.' +
        ' 16945 - 07/06/2004 */'
      '-- JOIN PARTASS COM PESSOA'
      '   (PA.IDPESSOA      = PE.IDPESSOA)        AND'
      '-- JOIN PARTASS COM PARTASS'
      '   (PA.SEQPROPOSTA   = PA.SEQPROPOSTA)     AND'
      
        '--   (PA.FLGINSCRICAOCANC = 0) AND  /* fernando - refer - 14/05/' +
        '2004 */'
      '-- JOIN BENEFASS COM PESSOA'
      '   (BE.IDTITULAR     = PE.IDPESSOA)        AND'
      '-- JOIN BENEFASS COM PARTASS'
      '   (BE.IDPESSJUR     = PA.IDPESSJUR)       AND'
      '   (BE.IDPLANOPREV   = PA.IDPLANOPREV)     AND'
      '   (BE.IDPLANASS     = PA.IDPLANASS)       AND'
      '-- JOIN BENEFASS COM BENEFASS'
      '   (BE.SEQPROPOSTA   = BE.SEQPROPOSTA)     AND'
      '   (BE.RESPONSAVELPAG = BE.RESPONSAVELPAG) AND'
      '   (BE.DATAENTRADA   = BE.DATAENTRADA)     AND'
      
        '--   (BE.FLGATIVO      = 1) AND  /* fernando - refer - 14/05/200' +
        '4'
      '-- ALTER JOIN PORTADORFORMA COM CONTASS'
      '   (PF.CODPORTFORMA(+) = CO.CODPORTFORMA)  AND'
      '-- JOIN PLANASS COM PARTASS'
      '   (PN.IDPLANASS     = PA.IDPLANASS) AND'
      ''
      '-- JOIN CONTASS COM CONTRIBUICAO'
      '   (CO.IDCONTASS = CT.IDCONTRIBUICAO)'
      ''
      'ORDER BY'
      '    PA.DATACANCELAMENTO DESC,PA.DATAENTRADA'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 405
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryPlanoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryPlanoINSCRICAONUMERO: TStringField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryPlanoIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
    end
    object qryPlanoBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 3
    end
    object qryPlanoPLANO: TStringField
      FieldName = 'PLANO'
      Size = 40
    end
    object qryPlanoDATAENTRADA: TDateTimeField
      FieldName = 'DATAENTRADA'
    end
    object qryPlanoDATACANCELAMENTO: TDateTimeField
      FieldName = 'DATACANCELAMENTO'
    end
    object qryPlanoFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 15
    end
    object qryPlanoIDCONTASS: TFloatField
      FieldName = 'IDCONTASS'
    end
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanoCONTRIBUICAO: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object qryPlanoCOBDIF: TStringField
      FieldName = 'COBDIF'
      Size = 3
    end
  end
  object qryInfPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CAPSEGASS'
      'WHERE (FLGVIGENCIA=1) AND'
      '              (IDPLANASS= :IDPLANASS)'
      'ORDER BY ORDEM')
    ValidateWithMask = True
    Left = 113
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
    object qryInfPlanoIDCAPSEGASS: TFloatField
      FieldName = 'IDCAPSEGASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDCAPSEGASS'
    end
    object qryInfPlanoIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDPLANASS'
    end
    object qryInfPlanoTIPOSEG: TStringField
      FieldName = 'TIPOSEG'
      Origin = 'BASEDADOS.CAPSEGASS.TIPOSEG'
      Size = 7
    end
    object qryInfPlanoCAPITALMN: TFloatField
      FieldName = 'CAPITALMN'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMN'
    end
    object qryInfPlanoCAPITALIP: TFloatField
      FieldName = 'CAPITALIP'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALIP'
    end
    object qryInfPlanoCAPITALMA: TFloatField
      FieldName = 'CAPITALMA'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMA'
    end
    object qryInfPlanoPREMIOFXA: TFloatField
      FieldName = 'PREMIOFXA'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXA'
    end
    object qryInfPlanoPREMIOFXB: TFloatField
      FieldName = 'PREMIOFXB'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXB'
    end
    object qryInfPlanoPREMIOFXC: TFloatField
      FieldName = 'PREMIOFXC'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXC'
    end
    object qryInfPlanoPREMIOFXD: TFloatField
      FieldName = 'PREMIOFXD'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXD'
    end
    object qryInfPlanoDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Origin = 'BASEDADOS.CAPSEGASS.DESCPLANO'
      Size = 40
    end
    object qryInfPlanoDTVIGENCIA: TDateTimeField
      FieldName = 'DTVIGENCIA'
      Origin = 'BASEDADOS.CAPSEGASS.DTVIGENCIA'
    end
    object qryInfPlanoFLGVIGENCIA: TStringField
      FieldName = 'FLGVIGENCIA'
      Origin = 'BASEDADOS.CAPSEGASS.FLGVIGENCIA'
      FixedChar = True
      Size = 1
    end
  end
  object DsInfPlano: TwwDataSource
    DataSet = qryInfPlano
    Left = 167
    Top = 204
  end
  object qryRegraIn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' QRYDEPLEGAL.HAVEDEPLEGAL, PB.IDPESSOA, PB.NUMDOCUMENTO, PFB.DAT' +
        'ANASC, PFB.SEXO, PFB.ESTCIVIL, PFB.DATAMORTE,'
      
        ' DT.IDDEPENDENCIA, DT.IDTITULAR, DT.IDPESSOA, D.IDSITDEPENDENTE,' +
        ' BA.IDPLANASS,'
      ' BA.IDPLANOPREV, BA.IDPESSJUR, BA.SEQPROPOSTA, BA.DATAENTRADA,'
      
        ' TO_CHAR(BA.DATAENTRADA,'#39'YYYY/MM'#39') MESENTRADA, PA.FLGINSCRICAOCA' +
        'NC, PA.INSCRICAONUMERO,'
      
        ' PA.DATACANCELAMENTO, PA.FLGPARTBENEF, PT.FLGFUNCIONARIO, EP.MAT' +
        'RICULA, EP.DATAADMISSAO,'
      
        ' EP.NIVEL, EP.TEMPOSERVANTERIOR, EP.TEMPONAOCREDITADO, EP.TEMPOS' +
        'ERVANTREAL,'
      
        ' EP.TEMPOSITESPECIAL, EP.VALORBASE1, EP.VALORBASE2, EP.VALORBASE' +
        '3, EP.NIVEL,'
      ' :MESREF MESREF, PPP.SALPARTICIPACAO,'
      
        ' PPP.SALMANTIDO, NVL(QRYBENEF.SALBENEFICIO,0) SALBENEFICIO, EP.S' +
        'ALREFERENCIA,'
      
        ' EP.IDSITFUNC, EP.DATADEMISSAO, PPP.IDSITPART, S.FLGINTERNO, F.S' +
        'ALARIOATUAL, DT.FLGDEPLEGAL,'
      ' BA.RESPONSAVELPAG, PA.OPCAOA, PA.OPCAOB'
      'FROM'
      
        ' PESSOA PB, PESSOAFISICA PFB, DEPENTIT DT, DEPENDENTE D, SITDEPE' +
        'NDENTE SD, BENEFASS BA,'
      
        ' PARTASS PA, ELEGPATRO EP, PESSOA PT, PARTPREVPLAN PPP, SITPART ' +
        'S, FUNCIONARIO F,'
      ' (SELECT BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR,'
      '         SUM(BF.VALORATUAL) SALBENEFICIO'
      '    FROM BENEFBFCIARIO BF'
      '   WHERE (BF.IDTITULAR   = :IDTITULAR)'
      '     AND (BF.IDPLANOPREV = :IDPLANOPREV)'
      '     AND (BF.IDPESSJUR   = :IDPESSJUR)'
      '-- Filtro para pegar apenas os benefícios com situação NORMAL'
      '     AND (BF.IDSITBENEFICIO = 1)'
      '-- Filtro para pegar apenas os benefícios diferentes de resgate'
      '     AND (BF.IDBENEFICIO NOT IN (20))'
      
        '   GROUP BY BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR, BF.IDPES' +
        'SOA) QRYBENEF,'
      ''
      '  (SELECT B.IDTITULAR, B.IDPLANASS, QRY.HAVEDEPLEGAL'
      '   FROM BENEFASS B,'
      '      (SELECT DECODE(COUNT(*),0,0,1,0,1) AS HAVEDEPLEGAL'
      '       FROM PESSOAFISICA PF, DEPENTIT D, BENEFASS B'
      '         WHERE PF.IDPESSOA  = PF.IDPESSOA     AND'
      '               D.IDTITULAR = :IDTITULAR  AND'
      '               D.IDPESSOA = PF.IDPESSOA AND'
      '               B.IDTITULAR = D.IDTITULAR AND'
      '               B.IDPLANASS    = :IDPLANASS AND'
      '               B.IDDEPENDENTE = D.IDPESSOA  AND'
      '               B.DTCANCELAMENTO IS NULL AND'
      
        '               ( ( D.IDDEPENDENCIA = '#39'PRP'#39' OR  D.IDDEPENDENCIA =' +
        ' '#39'COM'#39'  OR  D.IDDEPENDENCIA= '#39'COP'#39') OR'
      
        '                 ( D.IDDEPENDENCIA = '#39'FIL'#39'  AND TRUNC((SYSDATE -' +
        ' PF.DATANASC)/365.5) <= 24 )'
      '               )'
      '      ) QRY'
      '   WHERE B.IDDEPENDENTE = :IDDEPENDENTE AND'
      '         B.IDTITULAR    = :IDTITULAR    AND'
      '         B.IDPLANASS    = :IDPLANASS'
      '  ) QRYDEPLEGAL'
      ''
      'WHERE'
      ' (BA.IDTITULAR    = :IDTITULAR) AND'
      ' (BA.IDDEPENDENTE = :IDDEPENDENTE) AND'
      ' (BA.IDPESSJUR    = :IDPESSJUR) AND'
      ' (BA.IDPLANOPREV  = :IDPLANOPREV) AND'
      ' (BA.IDPLANASS    = :IDPLANASS) AND'
      ' (BA.IDTITULAR    = F.IDPESSOA(+)) AND'
      ' (BA.IDTITULAR    = DT.IDTITULAR) AND'
      ' (BA.IDDEPENDENTE = DT.IDPESSOA) AND'
      ' (BA.IDTITULAR    = PPP.IDPESSOA) AND'
      ' (BA.IDPLANOPREV  = PPP.IDPLANOPREV) AND'
      ' (BA.IDPESSJUR    = PPP.IDPESSJUR) AND'
      ' (PPP.IDSITPART   = S.IDSITPART) AND'
      ' (BA.IDTITULAR    = QRYBENEF.IDTITULAR(+)) AND'
      ' (BA.IDPLANOPREV  = QRYBENEF.IDPLANOPREV(+)) AND'
      ' (BA.IDPESSJUR    = QRYBENEF.IDPESSJUR(+)) AND'
      ''
      ' (BA.IDTITULAR    = QRYDEPLEGAL.IDTITULAR(+)) AND'
      ' (BA.IDPLANASS    = QRYDEPLEGAL.IDPLANASS(+)) AND'
      ''
      ' (BA.IDDEPENDENTE = PFB.IDPESSOA) AND'
      ' (BA.IDDEPENDENTE = D.IDPESSOA) AND'
      ' (D.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+)) AND'
      ' (BA.IDDEPENDENTE = PB.IDPESSOA) AND'
      ' (BA.IDPESSJUR   = PA.IDPESSJUR(+)) AND'
      ' (BA.SEQPROPOSTA = PA.SEQPROPOSTA(+)) AND'
      ' (BA.IDPLANOPREV = PA.IDPLANOPREV(+)) AND'
      ' (BA.IDTITULAR   = PA.IDPESSOA(+)) AND'
      ' (BA.IDPLANASS   = PA.IDPLANASS(+)) AND'
      ' (BA.IDTITULAR = PT.IDPESSOA) AND'
      ' (BA.IDPESSJUR = EP.IDPESSJUR) AND'
      ' (BA.IDTITULAR = EP.IDPESSOA)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 204
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object qryIdRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        'CT.IDTITULAR, CT.IDPESSJUR, PV.IDPLANOPREV, CT.IDPLANASS, CB.IDR' +
        'EGRA, BF.IDDEPENDENTE'
      
        ' FROM PARTPREVPLAN PV, PARTASS PT, BENEFASS BF, CONTASS CT, CONT' +
        'RIBASS CB, CONTRIBUICAO CR'
      'WHERE  (PT.IDPESSOA = :IDTITULAR) AND'
      '               (PT.IDPESSOA=PV.IDPESSOA) AND'
      '               (PT.IDPLANOPREV=PV.IDPLANOPREV) AND'
      '               (PV.FLGDESATIVADO=0) AND'
      '               (PT.IDPESSOA=CT.IDTITULAR) AND'
      '               ( PT.FLGINSCRICAOCANC=0) AND'
      '               (CT.IDPLANASS = :IDPLANASS) AND'
      '               (CT.IDCONTASS =  CB.IDCONTASS) AND'
      '               (CT.IDCONTASS = CR.IDCONTRIBUICAO) AND'
      '               (CT.IDTITULAR  =  BF.IDTITULAR) AND'
      '               (BF.FLGATIVO = 1) AND'
      '               (CT.FLGATIVO = 1) ')
    ValidateWithMask = True
    Left = 295
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
    object qryIdRegraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.CONTRIBASS.IDREGRA'
    end
    object qryIdRegraIDDEPENDENTE: TFloatField
      FieldName = 'IDDEPENDENTE'
      Origin = 'BASEDADOS.BENEFASS.IDDEPENDENTE'
    end
    object qryIdRegraIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.CONTASS.IDTITULAR'
    end
    object qryIdRegraIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.CONTASS.IDPESSJUR'
    end
    object qryIdRegraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.CONTASS.IDPLANOPREV'
    end
    object qryIdRegraIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.CONTASS.IDPLANASS'
    end
  end
  object qryHistPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   UPPER(PN.NOME) AS PLANO,'
      '   PA.DATAENTRADA,'
      '   PA.DATACANCELAMENTO,'
      '   DECODE(PA.OPCAOA,'#39'1'#39','#39'SIM'#39','#39'NÃO'#39') AS COBDIF,'
      
        '   DECODE(CO.FLGCOBCARNE,1,'#39'BOLETO BANCÁRIO'#39','#39'FOLHA'#39') AS FORMA_P' +
        'AGAMENTO,'
      '   CT.NOME AS CONTRIBUICAO,'
      '   PR.NOME AS PLANOPREV,'
      '   PA.OBSCANCEL'
      'FROM'
      '   PARTPREVPLAN  PV,'
      '   CONTASS       CO,'
      '   BENEFASS      BE,'
      '   PARTASS       PA,'
      '   PORTADORFORMA PF,'
      '   PLANASS       PN,'
      '   CONTRIBUICAO  CT,'
      '   PLANPREV      PR'
      'WHERE'
      '   (PA.IDPESSOA     = :IDPESSOA)          AND'
      '   (PA.FLGINSCRICAOCANC = 1) AND'
      ''
      '   (PV.IDPESSOA = PA.IDPESSOA) AND'
      '   (PV.IDPLANOPREV = PA.IDPLANOPREV) AND'
      ''
      '   (PV.IDPLANOPREV = PR.IDPLANOPREV) AND'
      ''
      '   (CO.IDPLANASS(+)   = PA.IDPLANASS)       AND'
      '   (CO.IDPLANOPREV(+) = PA.IDPLANOPREV)     AND'
      '   (CO.IDPESSJUR(+)   = PA.IDPESSJUR)       AND'
      '   (CO.FLGATIVO(+) = 0) AND'
      ''
      '   (CO.IDDEPENDENTE  = BE.IDDEPENDENTE)    AND'
      ''
      '   (CO.IDCONTASS     = CO.IDCONTASS)       AND'
      '   (CO.SEQPROPOSTA   = CO.SEQPROPOSTA)     AND'
      ''
      '   (PA.SEQPROPOSTA   = PA.SEQPROPOSTA)     AND'
      ''
      '   (BE.IDPESSJUR(+)     = PA.IDPESSJUR)       AND'
      '   (BE.IDPLANOPREV(+)   = PA.IDPLANOPREV)     AND'
      '   (BE.IDPLANASS(+)     = PA.IDPLANASS)       AND'
      '   (BE.FLGATIVO(+) = 0) AND'
      ''
      '   (BE.SEQPROPOSTA   = BE.SEQPROPOSTA)     AND'
      '   (BE.RESPONSAVELPAG = BE.RESPONSAVELPAG) AND'
      '   (BE.DATAENTRADA   = BE.DATAENTRADA)     AND'
      ''
      '   (PF.CODPORTFORMA(+) = CO.CODPORTFORMA)  AND'
      ''
      '   (PN.IDPLANASS     = PA.IDPLANASS) AND'
      ''
      '   (CO.IDCONTASS = CT.IDCONTRIBUICAO)'
      ''
      'ORDER BY PA.DATACANCELAMENTO DESC, PA.DATAENTRADA'
      '')
    ValidateWithMask = True
    Left = 441
    Top = 335
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsHistPlano: TwwDataSource
    DataSet = qryHistPlano
    Left = 516
    Top = 335
  end
end
