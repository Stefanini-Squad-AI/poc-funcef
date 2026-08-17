inherited frmCalendarioAgenda: TfrmCalendarioAgenda
  Left = 140
  Top = 229
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calendário de Agendamento'
  ClientHeight = 355
  ClientWidth = 771
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 771
    Height = 316
    object pgcCalendario: TPageControl
      Left = 1
      Top = 1
      Width = 769
      Height = 314
      ActivePage = tbsPorAtendente
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = pgcCalendarioChange
      object tbsPorData: TTabSheet
        Caption = 'Por Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object pnlTopData: TPanel
          Left = 0
          Top = 0
          Width = 761
          Height = 34
          Align = alTop
          Color = clSilver
          TabOrder = 0
          object lblPorData: TLabel
            Left = 7
            Top = 11
            Width = 32
            Height = 13
            Caption = 'Data:'
          end
          object dtData: TwwDBDateTimePicker
            Left = 44
            Top = 7
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            ShowButton = True
            TabOrder = 0
            DisplayFormat = 'dd/mm/yyyy'
            OnCloseUp = dtDataCloseUp
            OnEnter = dtDataEnter
            OnExit = dtDataExit
            OnKeyDown = dtDataKeyDown
          end
        end
        object pnlBodyPorData: TPanel
          Left = 0
          Top = 34
          Width = 761
          Height = 252
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object splttrPorData: TSplitter
            Left = 81
            Top = 1
            Width = 5
            Height = 250
            Cursor = crHSplit
            Beveled = True
            Color = clGray
            ParentColor = False
            ResizeStyle = rsUpdate
          end
          object pnlPorDataHorarios: TPanel
            Left = 1
            Top = 1
            Width = 80
            Height = 250
            Align = alLeft
            BevelOuter = bvNone
            Constraints.MinWidth = 75
            TabOrder = 0
            object dbgrdHorarios: TwwDBGrid
              Left = 0
              Top = 0
              Width = 80
              Height = 250
              Selected.Strings = (
                'HORARIO'#9'50'#9'Horários'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              OnRowChanged = dbgrdHorariosRowChanged
              FixedCols = 0
              ShowHorzScrollBar = False
              Align = alClient
              Color = 13828095
              DataSource = dtsHorariosNaData
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              RowHeightPercent = 120
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              IndicatorColor = icBlack
            end
          end
          object dbgrdAtendentesNoHorario: TwwDBGrid
            Left = 86
            Top = 1
            Width = 674
            Height = 250
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = False
            Align = alClient
            Color = clWhite
            DataSource = dtsAtendentesNoHorario
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
            RowHeightPercent = 120
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnDrawDataCell = dbgrdAtendentesNoHorarioDrawDataCell
            OnDblClick = dbgrdAtendentesNoHorarioDblClick
            IndicatorColor = icBlack
          end
        end
      end
      object tbsPorAtendente: TTabSheet
        Caption = 'Por Atendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ImageIndex = 1
        ParentFont = False
        object pnlTopAtendente: TPanel
          Left = 0
          Top = 0
          Width = 761
          Height = 34
          Align = alTop
          Color = clSilver
          TabOrder = 0
          object lblPorAtendente: TLabel
            Left = 7
            Top = 10
            Width = 63
            Height = 13
            Caption = 'Atendente:'
          end
          object cmbAtendente: TwwDBLookupCombo
            Left = 74
            Top = 6
            Width = 679
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Usuário'#9'F'
              'NOMEUSUARIO'#9'20'#9'Nome'#9'F')
            LookupTable = cdsAtendeAgenda
            LookupField = 'IDATENDEAGENDA'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = cmbAtendenteCloseUp
            OnEnter = cmbAtendenteEnter
            OnExit = cmbAtendenteExit
            OnKeyDown = cmbAtendenteKeyDown
          end
        end
        object pnlBodyPorAtendente: TPanel
          Left = 0
          Top = 34
          Width = 761
          Height = 252
          Align = alClient
          TabOrder = 1
          object pnlProximo: TPanel
            Left = 510
            Top = 5
            Width = 247
            Height = 243
            BevelOuter = bvLowered
            TabOrder = 0
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 245
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = 15395562
              TabOrder = 0
              object lblDiaSemanaPos: TLabel
                Left = 6
                Top = 5
                Width = 139
                Height = 13
                Caption = 'Terça-feira, 23/11/2005'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 6447714
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object dbgrdPos: TwwDBGrid
              Left = 1
              Top = 25
              Width = 245
              Height = 217
              Selected.Strings = (
                'HORARIO'#9'7'#9'Horário'
                'Situacao'#9'10'#9'Situação'
                'SOLICITANTE'#9'30'#9'Solicitante'
                'ASSUNTO'#9'20'#9'Assunto')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              Color = clWhite
              DataSource = dtsPos
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              RowHeightPercent = 120
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnDrawDataCell = dbgrdPosDrawDataCell
              OnDblClick = dbgrdAtendentesNoHorarioDblClick
              OnEnter = dbgrdAntEnter
              IndicatorColor = icBlack
            end
          end
          object pnlAtual: TPanel
            Left = 257
            Top = 5
            Width = 248
            Height = 243
            BevelOuter = bvLowered
            TabOrder = 1
            object pnlAtualTop: TPanel
              Left = 1
              Top = 1
              Width = 246
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = 15395562
              TabOrder = 0
              object btnAnt: TSpeedButton
                Left = 2
                Top = 1
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  76050000424D7605000000000000360000002800000015000000150000000100
                  1800000000004005000000000000000000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8000000CDCDCDFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090902C29302E2F2EC0C0C0FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFCFCFB8F8F8F332C3CA1AA9617151BC1C2C1FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFBFBFA8D8D8D483758829B6993F92B180828C6C7C6FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFF9FAF98F8E914B41547C906681FF0192FF1F18052BBABBB8FEFE
                  FDF2F3F2F3F3F2F3F3F2F3F3F2F3F4F2EFEFEEFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFAFBFA8F8D90453C4F78955985FB0D7FFF008DF3263A1B5A473C52685C
                  7460556C61556D61556D61556D61556E544C5C9B9B9BFFFFFF00FFFFFFFFFFFF
                  FCFCFC8C8C8C4B415578965A85F4147FFF007FFF0082F3107796585A852E5782
                  2C57822C57822C57822C57822C578627607F400E0D10EDECEE00FFFFFFFFFFFF
                  8E8E8D4738577B8F6685FB0D7FFF0080FF0080FF007FFD0083F80C87FF0F87FE
                  0F87FE0F87FE0F87FE0F87FE0F86FF089DF345000001E5E4E600FFFFFF929292
                  35284383957182FF057FFF0080FF0080FF0080FF0080FF007FFF007FFF007FFF
                  007FFF007FFF007FFF007FFF007EFF0093EF38020007E7E7E900B5B5B511051D
                  90A27B81FE037FFF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
                  0080FF0080FF0080FF0080FF007FFF0094ED3A010007E7E7E900000000D9FCB7
                  71F70080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
                  0080FF0080FF0080FF0080FF007FFF0094EE3A010007E7E7E900908D955C684D
                  ACFF4177FF007EFF0080FF0080FF0080FF0080FF0080FF007FFF007EFF007EFF
                  007EFF007EFF007EFF007EFF007DFF0093ED39010007E7E7E900FFFFFF776F80
                  7170709BFD347BFF007EFF0080FF0080FF0080FF007FFF0080FF0081FF0380FF
                  0280FF0280FF0280FF0280FF027FFF0097F33A000003E6E5E800FFFFFFFFFFFF
                  7D72877F7C8195F53280FF017DFF0080FF0080FF007AF10297DB54AAE85CA1E2
                  54A1E355A1E355A1E355A1E255A5E751A3D46C010003E8E6E800FFFFFFFFFFFF
                  F5F6F481798A7B7F7195EE3682FF047EFF0080FF0083E71D6B46928270938E7D
                  A189789C8A799D8A799D89789C8F7DA26F627C6D6B6EFBFBFA00FFFFFFFFFFFF
                  FFFFFFF3F3F287808F747D6494EF3780FF017DFF0093FC27130126898B87C5C6
                  C4BABBB9BBBCBABBBCBABBBCBABBBCBAB5B6B5F5F6F5FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFF2F1F387808F7B7F7094F4317BFF0090FA2618052CCDCECCFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFF2F2F282788B7F7B819BFF2C89FF1119052CC1C2C1FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFF5F6F47C7188717767C3FF7312051EC2C2C1FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76727B52525529282BC0C0C0FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B4B6000000CDCDCDFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
                OnClick = btnAntClick
              end
              object btnProx: TSpeedButton
                Left = 221
                Top = 1
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  76050000424D7605000000000000360000002800000015000000150000000100
                  1800000000004005000000000000000000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCD000000B8B8B8FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C02E2F2E2C29309090
                  90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C2C117151BA1AA96332C
                  3C8F8F8FFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C7C618082893F92B829B
                  694837588D8D8DFBFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  EFEFEEF3F4F2F3F3F2F3F3F2F3F3F2F2F3F2FEFEFDBABBB818052B92FF1F81FF
                  017C90664B41548F8E91F9FAF9FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF9B9B9B
                  544C5C61556E61556D61556D61556D60556C685C74473C523A1B5A8DF3267FFF
                  0085FB0D789559453C4F8F8D90FAFBFAFFFFFFFFFFFFFFFFFF00EDECEE0E0D10
                  607F4057862757822C57822C57822C57822C57822C5A852E77965882F3107FFF
                  007FFF0085F41478965A4B41558C8C8CFCFCFCFFFFFFFFFFFF00E5E4E6000001
                  9DF34586FF0887FE0F87FE0F87FE0F87FE0F87FE0F87FF0F83F80C7FFD0080FF
                  0080FF007FFF0085FB0D7B8F664738578E8E8DFFFFFFFFFFFF00E7E7E9020007
                  93EF387EFF007FFF007FFF007FFF007FFF007FFF007FFF007FFF0080FF0080FF
                  0080FF0080FF007FFF0082FF05839571352843929292FFFFFF00E7E7E9010007
                  94ED3A7FFF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
                  0080FF0080FF0080FF007FFF0081FE0390A27B11051DB5B5B500E7E7E9010007
                  94EE3A7FFF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
                  0080FF0080FF0080FF0080FF0080FF0071F700D9FCB700000000E7E7E9010007
                  93ED397DFF007EFF007EFF007EFF007EFF007EFF007EFF007FFF0080FF0080FF
                  0080FF0080FF0080FF007EFF0077FF00ACFF415C684D908D9500E6E5E8000003
                  97F33A7FFF0080FF0280FF0280FF0280FF0280FF0281FF0380FF007FFF0080FF
                  0080FF0080FF007EFF007BFF009BFD34717070776F80FFFFFF00E8E6E8010003
                  A3D46CA5E751A1E255A1E355A1E355A1E355A1E254AAE85C97DB547AF10280FF
                  0080FF007DFF0080FF0195F5327F7C817D7287FFFFFFFFFFFF00FBFBFA6D6B6E
                  6F627C8F7DA289789C8A799D8A799D89789C8E7DA18270936B469283E71D80FF
                  007EFF0082FF0495EE367B7F7181798AF5F6F4FFFFFFFFFFFF00FFFFFFF5F6F5
                  B5B6B5BBBCBABBBCBABBBCBABBBCBABABBB9C5C6C4898B8713012693FC277DFF
                  0080FF0194EF37747D6487808FF3F3F2FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCECC18052C90FA267BFF
                  0094F4317B7F7087808FF2F1F3FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C2C119052C89FF119BFF
                  2C7F7B8182788BF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C112051EC3FF737177
                  677C7188F5F6F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C029282B5252557672
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCD000000B5B4B6FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
                OnClick = btnProxClick
              end
              object lblDiaSemanaAtual: TLabel
                Left = 31
                Top = 5
                Width = 84
                Height = 13
                Caption = 'Segunda-feira,'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 6447714
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dtAtual: TwwDBDateTimePicker
                Left = 119
                Top = 2
                Width = 97
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = 13828095
                Date = 38678
                Epoch = 1950
                ButtonEffects.Transparent = True
                ButtonEffects.Flat = True
                ShowButton = True
                TabOrder = 0
                UnboundDataType = wwDTEdtDate
                DisplayFormat = 'dd/mm/yyyy'
                OnCloseUp = dtAtualCloseUp
                OnEnter = dtAtualEnter
                OnExit = dtAtualExit
                OnKeyDown = dtAtualKeyDown
              end
            end
            object dbgrdAtual: TwwDBGrid
              Left = 1
              Top = 25
              Width = 246
              Height = 217
              Selected.Strings = (
                'HORARIO'#9'7'#9'Horário'
                'Situacao'#9'10'#9'Situação'#9'F'
                'SOLICITANTE'#9'30'#9'Solicitante'
                'ASSUNTO'#9'20'#9'Assunto')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              Color = clWhite
              DataSource = dtsAtual
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              RowHeightPercent = 120
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnDrawDataCell = dbgrdAtualDrawDataCell
              OnDblClick = dbgrdAtendentesNoHorarioDblClick
              OnEnter = dbgrdAntEnter
              IndicatorColor = icBlack
            end
          end
          object pnlAnterior: TPanel
            Left = 5
            Top = 5
            Width = 247
            Height = 243
            BevelOuter = bvLowered
            TabOrder = 2
            object Panel1: TPanel
              Left = 1
              Top = 1
              Width = 245
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = 15395562
              TabOrder = 0
              object lblDiaSemanaAnt: TLabel
                Left = 6
                Top = 5
                Width = 126
                Height = 13
                Caption = 'Domingo, 21/11/2005'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 6447714
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object dbgrdAnt: TwwDBGrid
              Left = 1
              Top = 25
              Width = 245
              Height = 217
              Selected.Strings = (
                'HORARIO'#9'7'#9'Horário'
                'Situacao'#9'10'#9'Situação'
                'SOLICITANTE'#9'30'#9'Solicitante'
                'ASSUNTO'#9'20'#9'Assunto')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              Color = clWhite
              DataSource = dtsAnt
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              RowHeightPercent = 120
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnDrawDataCell = dbgrdAntDrawDataCell
              OnDblClick = dbgrdAtendentesNoHorarioDblClick
              OnEnter = dbgrdAntEnter
              IndicatorColor = icBlack
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 316
    Width = 771
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Action = actDefinir
        Caption = 'Definir'
        Default = False
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 323
  end
  object cdsHorariosNaData: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 196
    object cdsHorariosNaDataHORARIO: TStringField
      DisplayLabel = 'Horários'
      DisplayWidth = 50
      FieldName = 'HORARIO'
      EditMask = '99:99;0; '
      Size = 4
    end
  end
  object dtsHorariosNaData: TDataSource
    DataSet = cdsHorariosNaData
    Left = 38
    Top = 228
  end
  object cdsAtendentesNoHorario: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SOLICITANTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ASSUNTO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'IDAGENDAMENTO'
        DataType = ftFloat
      end
      item
        Name = 'IDATENDEAGENDA'
        DataType = ftFloat
      end
      item
        Name = 'FLGSITUACAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsAtendentesNoHorarioCalcFields
    Left = 109
    Top = 107
    object cdsAtendentesNoHorarioNOME: TStringField
      DisplayLabel = 'Atendente'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object cdsAtendentesNoHorarioSituacao: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'Situacao'
      Size = 10
      Calculated = True
    end
    object cdsAtendentesNoHorarioSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      DisplayWidth = 30
      FieldName = 'SOLICITANTE'
      Size = 60
    end
    object cdsAtendentesNoHorarioASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 20
      FieldName = 'ASSUNTO'
      Size = 35
    end
    object cdsAtendentesNoHorarioIDAGENDAMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENDAMENTO'
      Visible = False
    end
    object cdsAtendentesNoHorarioAusente: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Ausente'
      Visible = False
      Calculated = True
    end
    object cdsAtendentesNoHorarioIDATENDEAGENDA: TFloatField
      FieldName = 'IDATENDEAGENDA'
      Visible = False
    end
    object cdsAtendentesNoHorarioFLGSITUACAO: TFloatField
      FieldName = 'FLGSITUACAO'
      Visible = False
    end
  end
  object dtsAtendentesNoHorario: TDataSource
    DataSet = cdsAtendentesNoHorario
    Left = 141
    Top = 107
  end
  object cdsAtendeAgenda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 23
    object cdsAtendeAgendaNOME: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object cdsAtendeAgendaNOMEUSUARIO: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object cdsAtendeAgendaIDATENDEAGENDA: TFloatField
      FieldName = 'IDATENDEAGENDA'
      Visible = False
    end
  end
  object cdsAtual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsAtualCalcFields
    Left = 270
    Top = 272
    object cdsAtualHORARIO: TStringField
      DisplayLabel = 'Horário'
      DisplayWidth = 7
      FieldName = 'HORARIO'
      EditMask = '99:99;0; '
      Size = 4
    end
    object cdsAtualSituacao: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Situacao'
      Size = 10
      Calculated = True
    end
    object cdsAtualSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      DisplayWidth = 30
      FieldName = 'SOLICITANTE'
      Size = 60
    end
    object cdsAtualASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 20
      FieldName = 'ASSUNTO'
      Size = 35
    end
    object cdsAtualAusente: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Ausente'
      Visible = False
      Calculated = True
    end
    object cdsAtualIDAGENDAMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENDAMENTO'
      Visible = False
    end
    object cdsAtualFLGSITUACAO: TFloatField
      FieldName = 'FLGSITUACAO'
      Visible = False
    end
  end
  object dtsAtual: TDataSource
    DataSet = cdsAtual
    Left = 302
    Top = 272
  end
  object cdsAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsAntCalcFields
    Left = 22
    Top = 272
    object cdsAntHORARIO: TStringField
      DisplayLabel = 'Horário'
      DisplayWidth = 7
      FieldName = 'HORARIO'
      EditMask = '99:99;0; '
      Size = 4
    end
    object cdsAntSituacao: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Situacao'
      Size = 10
      Calculated = True
    end
    object cdsAntSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      DisplayWidth = 30
      FieldName = 'SOLICITANTE'
      Size = 60
    end
    object cdsAntASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 20
      FieldName = 'ASSUNTO'
      Size = 35
    end
    object cdsAntAusente: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Ausente'
      Visible = False
      Calculated = True
    end
    object cdsAntIDAGENDAMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENDAMENTO'
      Visible = False
    end
    object cdsAntFLGSITUACAO: TFloatField
      FieldName = 'FLGSITUACAO'
      Visible = False
    end
  end
  object dtsAnt: TDataSource
    DataSet = cdsAnt
    Left = 54
    Top = 272
  end
  object cdsPos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsPosCalcFields
    Left = 526
    Top = 272
    object cdsPosHORARIO: TStringField
      DisplayLabel = 'Horário'
      DisplayWidth = 7
      FieldName = 'HORARIO'
      EditMask = '99:99;0; '
      Size = 4
    end
    object cdsPosSituacao: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Situacao'
      Size = 10
      Calculated = True
    end
    object cdsPosSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      DisplayWidth = 30
      FieldName = 'SOLICITANTE'
      Size = 60
    end
    object cdsPosASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 20
      FieldName = 'ASSUNTO'
      Size = 35
    end
    object cdsPosAusente: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Ausente'
      Visible = False
      Calculated = True
    end
    object cdsPosIDAGENDAMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENDAMENTO'
      Visible = False
    end
    object cdsPosFLGSITUACAO: TFloatField
      FieldName = 'FLGSITUACAO'
      Visible = False
    end
  end
  object dtsPos: TDataSource
    DataSet = cdsPos
    Left = 558
    Top = 272
  end
  object ActionList: TActionList
    Left = 637
    Top = 123
    object actDefinir: TAction
      Caption = 'Definir'
      Hint = 'Definir'
      OnExecute = actDefinirExecute
      OnUpdate = actDefinirUpdate
    end
  end
end
