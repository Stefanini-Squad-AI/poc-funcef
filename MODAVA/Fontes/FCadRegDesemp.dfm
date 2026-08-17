inherited frmCadRegDesemp: TfrmCadRegDesemp
  Left = 110
  Top = 122
  Caption = 'Registro de Avaliação de Desempenho'
  ClientWidth = 604
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 604
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 596
      Height = 38
      object Label1: TLabel
        Left = 12
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        FocusControl = dbedMatricula
      end
      object Label10: TLabel
        Left = 178
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedMatricula
      end
      object dbedMatricula: TDBEdit
        Left = 75
        Top = 6
        Width = 84
        Height = 21
        TabStop = False
        DataField = 'MATRICULA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object dbedNome: TDBEdit
        Left = 215
        Top = 6
        Width = 359
        Height = 21
        TabStop = False
        DataField = 'NOME'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 42
      Width = 596
      Height = 292
      Tabs.Strings = (
        'Dados Gerais'
        'Fatores e Pontos'
        'Fortes e Fracos'
        'Metas e Medidas'
        'Resumo e Comentarios')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 498
        Height = 233
        ActivePage = tbshGerais
        object tbshGerais: TTabSheet [0]
          Caption = 'Dados Gerais'
          object Label8: TLabel
            Left = 314
            Top = 21
            Width = 54
            Height = 13
            Caption = 'Avaliador'
            FocusControl = dbedAvaliador
          end
          object Label2: TLabel
            Left = 42
            Top = 21
            Width = 104
            Height = 13
            Caption = 'Tipo de Avaliação'
          end
          object Label3: TLabel
            Left = 42
            Top = 78
            Width = 88
            Height = 13
            Caption = 'Data Planejada'
          end
          object Label4: TLabel
            Left = 163
            Top = 78
            Width = 58
            Height = 13
            Caption = 'Data Real'
          end
          object Label5: TLabel
            Left = 314
            Top = 78
            Width = 57
            Height = 13
            Caption = 'Avaliação'
            FocusControl = dbedAvaliacao
          end
          object dbedAvaliador: TDBEdit
            Left = 313
            Top = 35
            Width = 244
            Height = 21
            DataField = 'AVALIADOR'
            DataSource = ds
            MaxLength = 20
            TabOrder = 0
          end
          object dblcTipoEntr: TwwDBLookupCombo
            Left = 42
            Top = 35
            Width = 244
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL')
            DataField = 'CODTIPOAVAL'
            DataSource = ds
            LookupTable = qryTipoAval
            LookupField = 'CODTIPOAVAL'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
            OnDropDown = dblcTipoEntrDropDown
            OnCloseUp = dblcTipoEntrCloseUp
          end
          object dbedDatPlan: TCMDateTimePicker
            Left = 42
            Top = 92
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPLAN'
            DataSource = ds
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
          object dbedDatReal: TCMDateTimePicker
            Left = 161
            Top = 92
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAREAL'
            DataSource = ds
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
            TabOrder = 3
          end
          object dbedAvaliacao: TDBEdit
            Left = 314
            Top = 92
            Width = 84
            Height = 21
            TabStop = False
            DataField = 'AVALIACAO'
            DataSource = ds
            ReadOnly = True
            TabOrder = 4
          end
          object bbtnBuscaEmpregado: TBitBtn
            Left = 374
            Top = 8
            Width = 30
            Height = 25
            Hint = 'Busca Empregado como Avaliador'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = bbtnBuscaEmpregadoClick
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              1000030000000002000000000000000000000000000000000000007C0000E003
              00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
              1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
              1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
              1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
              00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
              FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
              FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
              104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
              1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
              1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C}
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Fatores e Pontos'
          inherited dbgrdDet: TwwDBGrid
            Width = 490
            Height = 205
            Selected.Strings = (
              'DESCRFATORAVAL'#9'30'#9'Fator de Avaliacao'#9'No'
              'GRAU'#9'10'#9'Grau Atribuido'#9'No'
              'PESO'#9'10'#9'Peso'#9'No'
              'NOTA'#9'10'#9'Nota'#9'No')
          end
          inherited pnlControlesDet: TPanel
            Width = 490
            Height = 205
            object Label6: TLabel
              Left = 84
              Top = 11
              Width = 108
              Height = 13
              Caption = 'Fator de Avaliação'
            end
            object Label7: TLabel
              Left = 85
              Top = 74
              Width = 82
              Height = 13
              Caption = 'Grau Atribuido'
              FocusControl = dbedGrau
            end
            object Label18: TLabel
              Left = 202
              Top = 74
              Width = 80
              Height = 13
              Caption = 'Peso do Fator'
              FocusControl = dbedPeso
            end
            object Label19: TLabel
              Left = 319
              Top = 74
              Width = 88
              Height = 13
              Caption = 'Nota Calculada'
              FocusControl = dbedNota
            end
            object dblcFator: TwwDBLookupCombo
              Left = 83
              Top = 25
              Width = 325
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRFATORAVAL'#9'30'#9'DESCRFATORAVAL')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet
              LookupTable = qryFator
              LookupField = 'IDFATORAVAL'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnDropDown = dblcFatorDropDown
              OnCloseUp = dblcFatorCloseUp
            end
            object dbedGrau: TDBEdit
              Left = 86
              Top = 88
              Width = 82
              Height = 21
              DataField = 'GRAU'
              DataSource = dsDet
              MaxLength = 20
              TabOrder = 1
              OnChange = dbedGrauChange
            end
            object dbedPeso: TDBEdit
              Left = 203
              Top = 88
              Width = 85
              Height = 21
              TabStop = False
              DataField = 'PESO'
              DataSource = dsDet
              MaxLength = 20
              ReadOnly = True
              TabOrder = 2
            end
            object dbedNota: TDBEdit
              Left = 320
              Top = 88
              Width = 88
              Height = 21
              TabStop = False
              DataField = 'NOTA'
              DataSource = dsDet
              MaxLength = 20
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
        object tbshFortes: TTabSheet
          Caption = 'Fortes e Fracos'
          object Label9: TLabel
            Left = 30
            Top = 0
            Width = 79
            Height = 13
            Caption = 'Pontos Fortes'
            FocusControl = dbmemFortes
          end
          object Label11: TLabel
            Left = 30
            Top = 75
            Width = 82
            Height = 13
            Caption = 'Pontos Fracos'
            FocusControl = dbmemFracos
          end
          object Label12: TLabel
            Left = 30
            Top = 150
            Width = 120
            Height = 13
            Caption = 'Principais Limitações'
            FocusControl = dbmemLimites
          end
          object dbmemFortes: TDBMemo
            Left = 30
            Top = 15
            Width = 525
            Height = 55
            DataField = 'FORTES'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbmemFracos: TDBMemo
            Left = 30
            Top = 90
            Width = 525
            Height = 55
            DataField = 'FRACOS'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object dbmemLimites: TDBMemo
            Left = 31
            Top = 165
            Width = 525
            Height = 55
            DataField = 'LIMITACOES'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object tbshMetas: TTabSheet
          Caption = 'Metas e Medidas'
          object Label16: TLabel
            Left = 30
            Top = -2
            Width = 172
            Height = 13
            Caption = 'Metas para o Próximo Período'
            FocusControl = dbmemMetas
          end
          object Label17: TLabel
            Left = 30
            Top = 115
            Width = 139
            Height = 13
            Caption = 'Medidas Recomendadas'
            FocusControl = dbmemMedidas
          end
          object dbmemMetas: TDBMemo
            Left = 30
            Top = 12
            Width = 525
            Height = 90
            DataField = 'METAS'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbmemMedidas: TDBMemo
            Left = 30
            Top = 129
            Width = 525
            Height = 90
            DataField = 'MEDIDAS'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object tbshResumo: TTabSheet
          Caption = 'Resumo e Comentários'
          object Label13: TLabel
            Left = 30
            Top = 0
            Width = 124
            Height = 13
            Caption = 'Resumo da Avaliação'
            FocusControl = dbmemResumo
          end
          object Label15: TLabel
            Left = 30
            Top = 74
            Width = 145
            Height = 13
            Caption = 'Comentários do Avaliador'
            FocusControl = dbmemObs1
          end
          object Label14: TLabel
            Left = 30
            Top = 149
            Width = 141
            Height = 13
            Caption = 'Comentários do Avaliado'
            FocusControl = dbmemObs1
          end
          object dbmemResumo: TDBMemo
            Left = 31
            Top = 15
            Width = 525
            Height = 55
            DataField = 'RESUMO'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbmemObs1: TDBMemo
            Left = 30
            Top = 90
            Width = 525
            Height = 55
            DataField = 'OBSERVAVAL'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object dbmemObs2: TDBMemo
            Left = 30
            Top = 165
            Width = 525
            Height = 55
            DataField = 'COMENT'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
      end
      inherited Dock973: TDock97
        Width = 588
      end
      inherited Dock974: TDock97
        Left = 502
        Height = 233
      end
    end
  end
  inherited Dock972: TDock97
    Width = 604
  end
  inherited Dock971: TDock97
    Width = 604
    inherited tb97Fundo: TToolbar97
      Left = 434
      DockPos = 442
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 267
      DockPos = 275
    end
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT F.MATRICULA, P.NOME, H.IDPESSOA,H.CODTIPOAVAL,'
      '       H.NUMSEQ,H.DATAPLAN,H.DATAREAL,H.AVALIACAO,H.AVALIADOR,'
      
        '       H.FORTES,H.FRACOS,H.LIMITACOES,H.METAS,H.MEDIDAS,H.RESUMO' +
        ','
      '       H.OBSERVAVAL,H.COMENT,C.CODGRPFUNC'
      'FROM FUNCIONARIO F, PESSOA P, HSTAVAL H, TIPOAVAL T,CARGO C'
      'WHERE H.IDPESSOA    = P.IDPESSOA'
      'AND   H.IDPESSOA        = F.IDPESSOA'
      'AND   H.CODTIPOAVAL = T.CODTIPOAVAL'
      'AND   T.FLGTIPOAVAL < 2'
      'AND   F.IDCARGO          = C.IDCARGO'
      'AND   H.IDPESSOA        = :IDPESSOA'
      'AND   H.CODTIPOAVAL = :CODTIPOAVAL'
      'AND   H.NUMSEQ          = :NUMSEQ')
    Left = 300
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODTIPOAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMSEQ'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = tblHstava
    Left = 375
    Top = 13
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTAVAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODTIPOAVAL = :CODTIPOAVAL,'
      '  NUMSEQ = :NUMSEQ,'
      '  DATAPLAN = :DATAPLAN,'
      '  DATAREAL = :DATAREAL,'
      '  AVALIACAO = :AVALIACAO,'
      '  AVALIADOR = :AVALIADOR,'
      '  FORTES = :FORTES,'
      '  FRACOS = :FRACOS,'
      '  LIMITACOES = :LIMITACOES,'
      '  METAS = :METAS,'
      '  MEDIDAS = :MEDIDAS,'
      '  RESUMO = :RESUMO,'
      '  OBSERVAVAL = :OBSERVAVAL,'
      '  COMENT = :COMENT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODTIPOAVAL = :OLD_CODTIPOAVAL and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into HSTAVAL'
      
        '  (IDPESSOA, CODTIPOAVAL, NUMSEQ, DATAPLAN, DATAREAL, AVALIACAO,' +
        ' AVALIADOR, '
      
        '   FORTES, FRACOS, LIMITACOES, METAS, MEDIDAS, RESUMO, OBSERVAVA' +
        'L, COMENT)'
      'values'
      
        '  (:IDPESSOA, :CODTIPOAVAL, :NUMSEQ, :DATAPLAN, :DATAREAL, :AVAL' +
        'IACAO, '
      
        '   :AVALIADOR, :FORTES, :FRACOS, :LIMITACOES, :METAS, :MEDIDAS, ' +
        ':RESUMO, '
      '   :OBSERVAVAL, :COMENT)')
    DeleteSQL.Strings = (
      'delete from HSTAVAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODTIPOAVAL = :OLD_CODTIPOAVAL and'
      '  NUMSEQ = :OLD_NUMSEQ')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'upper(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'TIPOAVAL.DESCRTIPOAVAL'
      'HSTAVAL.DATAPLAN'
      'HSTAVAL.DATAREAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nome'
      'Matricula'
      'Tipo de Avaliacao'
      'Data Planejada'
      'Data Real')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'TIPOAVAL'
      'HSTAVAL')
    CamposChave.Strings = (
      'HSTAVAL.IDPESSOA'
      'HSTAVAL.CODTIPOAVAL'
      'HSTAVAL.NUMSEQ')
    Filtro.Strings = (
      'HSTAVAL.IDPESSOA        = PESSOA.IDPESSOA'
      'HSTAVAL.IDPESSOA        = FUNCIONARIO.IDPESSOA'
      'HSTAVAL.CODTIPOAVAL = TIPOAVAL.CODTIPOAVAL'
      'TIPOAVAL.FLGTIPOAVAL < 2')
    Larguras.Strings = (
      '60'
      '22'
      '40'
      '15'
      '15')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryTipoAval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPOAVAL, DESCRTIPOAVAL'
      'FROM TIPOAVAL'
      'WHERE FLGTIPOAVAL < 2'
      'ORDER BY UPPER(DESCRTIPOAVAL)')
    ValidateWithMask = True
    Left = 525
    Top = 5
  end
  object qryFator: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFATORAVAL,DESCRFATORAVAL'
      'FROM FATORAVAL'
      'ORDER BY UPPER(DESCRFATORAVAL)')
    ValidateWithMask = True
    Left = 531
    Top = 68
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'upper(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 474
    Top = 66
  end
  object qryAuxNum: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(NUMSEQ) AS NUMSEQ'
      'FROM HSTAVAL'
      'WHERE IDPESSOA    = :IDPESSOA'
      'AND   CODTIPOAVAL = :CODTIPOAVAL')
    ValidateWithMask = True
    Left = 267
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODTIPOAVAL'
        ParamType = ptUnknown
      end>
  end
  object tblAval: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDFATORAVAL'
    TableName = 'CM.FATORAVAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 457
    Top = 238
  end
  object tblRelav: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC;IDFATORAVAL'
    TableName = 'CM.PESOFATGRP'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 517
    Top = 235
  end
  object tblHstava: TwwTable
    CachedUpdates = True
    AfterInsert = tblHstavaAfterInsert
    OnCalcFields = tblHstavaCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;CODTIPOAVAL;NUMSEQ'
    MasterFields = 'IDPESSOA;CODTIPOAVAL;NUMSEQ'
    MasterSource = ds
    TableName = 'CM.HSTDESEMP'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 490
    Top = 286
    object tblHstavaDESCRICAO: TStringField
      DisplayLabel = 'Fator de Avaliação'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = tblAval
      LookupKeyFields = 'IDFATORAVAL'
      LookupResultField = 'DESCRFATORAVAL'
      KeyFields = 'IDFATORAVAL'
      Size = 40
      Lookup = True
    end
    object tblHstavaGRAU: TFloatField
      DisplayLabel = 'Grau'
      DisplayWidth = 6
      FieldName = 'GRAU'
    end
    object tblHstavaPESO: TIntegerField
      DisplayLabel = 'Peso'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'PESO'
      Calculated = True
    end
    object tblHstavaNOTA: TIntegerField
      DisplayLabel = 'Nota'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'NOTA'
      Calculated = True
    end
    object tblHstavaCODTIPOAVAL: TFloatField
      FieldName = 'CODTIPOAVAL'
      Required = True
      Visible = False
    end
    object tblHstavaIDFATORAVAL: TFloatField
      FieldName = 'IDFATORAVAL'
      Required = True
      Visible = False
    end
    object tblHstavaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Required = True
      Visible = False
    end
    object tblHstavaNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
      Visible = False
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.CODGRPFUNC'
      'FROM FUNCIONARIO F, CARGO C'
      'WHERE F.IDPESSOA        = :IDPESSOA'
      'AND   F.IDCARGO          = C.IDCARGO')
    ValidateWithMask = True
    Left = 435
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
