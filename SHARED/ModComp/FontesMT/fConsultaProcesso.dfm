inherited frmConsultaProcesso: TfrmConsultaProcesso
  Left = 21
  Top = 80
  ActiveControl = bbtnProcurarProc
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Processo de Qualquer Matéria'
  ClientHeight = 453
  ClientWidth = 749
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 749
    Height = 414
    BorderWidth = 2
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 83
      Height = 13
      Caption = 'Nosso Número'
      FocusControl = dbedNumero
    end
    object Label2: TLabel
      Left = 12
      Top = 49
      Width = 118
      Height = 13
      Caption = 'Data do Ajuizamento'
    end
    object Label19: TLabel
      Left = 139
      Top = 49
      Width = 115
      Height = 13
      Caption = 'Data da Notificação'
    end
    object Label30: TLabel
      Left = 139
      Top = 8
      Width = 118
      Height = 13
      Caption = 'Número do Processo'
      FocusControl = dbedNumJCJ
    end
    object Label9: TLabel
      Left = 12
      Top = 90
      Width = 72
      Height = 13
      Caption = 'Contra-Parte'
    end
    object pgctrlDetalhe: TPageControl
      Left = 4
      Top = 128
      Width = 741
      Height = 282
      ActivePage = tbsLitisconsortes
      TabOrder = 0
      object tbsLitisconsortes: TTabSheet
        Caption = 'Litisconsortes'
        object dbgrDet2: TwwDBGrid
          Left = 0
          Top = 0
          Width = 733
          Height = 254
          Selected.Strings = (
            'NOME'#9'60'#9'Nome ou Razão Social'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsLitisconsorte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tbshOutrosDados: TTabSheet
        Caption = 'Outros Dados'
        object Label8: TLabel
          Left = 43
          Top = 10
          Width = 56
          Height = 13
          Caption = 'Despesas'
        end
        object Label4: TLabel
          Left = 264
          Top = 10
          Width = 118
          Height = 13
          Caption = 'Vara de Justiça e Nº'
        end
        object Label3: TLabel
          Left = 44
          Top = 33
          Width = 105
          Height = 13
          Caption = 'Data da Postagem'
        end
        object Label18: TLabel
          Left = 43
          Top = 78
          Width = 115
          Height = 13
          Caption = 'Quant. Requerentes'
          FocusControl = dbedQtde
        end
        object Label16: TLabel
          Left = 220
          Top = 33
          Width = 109
          Height = 13
          Caption = 'Número na 2a Inst.'
          FocusControl = dbedNumTRT
        end
        object Label17: TLabel
          Left = 220
          Top = 78
          Width = 121
          Height = 13
          Caption = 'Número na Inst. Sup.'
          FocusControl = dbedNumTST
        end
        object Label31: TLabel
          Left = 43
          Top = 122
          Width = 100
          Height = 13
          Caption = 'Tipo de Processo'
        end
        object Label33: TLabel
          Left = 43
          Top = 167
          Width = 77
          Height = 13
          Caption = 'Tipo de Açao'
        end
        object Label35: TLabel
          Left = 43
          Top = 213
          Width = 267
          Height = 13
          Caption = 'Pasta do Processo (Identificação/Localização)'
          FocusControl = dbedPasta
        end
        object Label5: TLabel
          Left = 393
          Top = 33
          Width = 285
          Height = 13
          Caption = 'Escritório/Advogado do Requerente ou Requerido'
          FocusControl = dbedAdvog1
        end
        object Label6: TLabel
          Left = 393
          Top = 78
          Width = 156
          Height = 13
          Caption = 'Nosso Escritório/Advogado'
          FocusControl = dbedAdvog2
        end
        object Label7: TLabel
          Left = 393
          Top = 122
          Width = 109
          Height = 13
          Caption = 'Assistente Técnico'
          FocusControl = dbedAT
        end
        object Label10: TLabel
          Left = 393
          Top = 167
          Width = 108
          Height = 13
          Caption = 'Advogado da Casa'
          FocusControl = dbedAdvogCasa
        end
        object Label36: TLabel
          Left = 393
          Top = 213
          Width = 175
          Height = 13
          Caption = 'Cidade Onde Corre o Processo'
        end
        object dbreDespesa: TDBRealEdit
          Left = 105
          Top = 6
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clGray
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'DESPESAPROC'
          DataSource = dsProcesso
        end
        object dbedVaraJustica: TDBEdit
          Left = 393
          Top = 6
          Width = 268
          Height = 21
          Color = clGray
          DataField = 'VARA_JUSTICA'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedNumVaraJustica: TwwDBEdit
          Left = 663
          Top = 6
          Width = 30
          Height = 21
          Color = clGray
          DataField = 'NUMVARAJUSTICA'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedPost: TDBEdit
          Left = 44
          Top = 49
          Width = 120
          Height = 21
          Color = clGray
          DataField = 'DATAPOST'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbedQtde: TDBEdit
          Left = 43
          Top = 94
          Width = 120
          Height = 21
          Color = clGray
          DataField = 'QTDERECTES'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbedNumTRT: TDBEdit
          Left = 220
          Top = 49
          Width = 120
          Height = 21
          Color = clGray
          DataField = 'PROCTRTNUM'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbedNumTST: TDBEdit
          Left = 220
          Top = 94
          Width = 120
          Height = 21
          Color = clGray
          DataField = 'PROCTSTNUM'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbedTipProc: TDBEdit
          Left = 43
          Top = 138
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'TIPO_PROCESSO'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbedTipAcao: TDBEdit
          Left = 43
          Top = 183
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'TIPO_ACAO'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbedPasta: TDBEdit
          Left = 43
          Top = 229
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'IDENTPASTA'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbedAdvog1: TDBEdit
          Left = 393
          Top = 49
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'ADVOG_REQ'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbedAdvog2: TDBEdit
          Left = 393
          Top = 94
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'NOSSO_ADVOG'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbedAT: TDBEdit
          Left = 393
          Top = 138
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'ASSIST_TECNICO'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbedAdvogCasa: TDBEdit
          Left = 393
          Top = 183
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'ADVOG_CASA'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbedUF: TDBEdit
          Left = 393
          Top = 229
          Width = 300
          Height = 21
          Color = clGray
          DataField = 'CIDADE'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
      end
      object tbsDet: TTabSheet
        Caption = 'Objetos do Processo'
        object dbgrdDet: TwwDBGrid
          Left = 0
          Top = 0
          Width = 733
          Height = 254
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Descrição do Objeto Reclamado'#9'F'
            'VALORRECL'#9'10'#9'Valor Reclamado'#9'F'
            'PERCPROB'#9'10'#9'Probabilidade (%)'#9'F'
            'VALORESPERADO'#9'10'#9'Valor Estimado'#9'F'
            'VALORSENTENCA'#9'10'#9'Valor Real'#9'F'
            'OBSERVACAO'#9'240'#9'OBSERVACAO'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsObjeto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tbshEncer: TTabSheet
        Caption = 'Encerramento'
        object Label15: TLabel
          Left = 314
          Top = 21
          Width = 99
          Height = 13
          Caption = 'Prev.Encerramto.'
        end
        object Label11: TLabel
          Left = 314
          Top = 77
          Width = 115
          Height = 13
          Caption = 'Número de Parcelas'
        end
        object Label12: TLabel
          Left = 479
          Top = 77
          Width = 128
          Height = 13
          Caption = 'Data de Encerramento'
        end
        object Label13: TLabel
          Left = 314
          Top = 135
          Width = 102
          Height = 13
          Caption = 'Tipo de Sentença'
        end
        object rgTipEncer: TDBRadioGroup
          Left = 127
          Top = 52
          Width = 121
          Height = 120
          Caption = 'Tipo'
          DataField = 'TIPOENCER'
          DataSource = dsProcesso
          Items.Strings = (
            'Arquivamento'
            'Acordo'
            'Desistência'
            'Sentença')
          ReadOnly = True
          TabOrder = 0
          Values.Strings = (
            'A'
            'C'
            'D'
            'S')
        end
        object dbedPrevEnc: TDBEdit
          Left = 314
          Top = 36
          Width = 100
          Height = 21
          TabStop = False
          Color = clGray
          DataField = 'DATAPREVENCER'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object sbspeParc: TDBEdit
          Left = 314
          Top = 92
          Width = 116
          Height = 21
          TabStop = False
          Color = clGray
          DataField = 'QTDEPARCACOR'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbedEncerr: TDBEdit
          Left = 480
          Top = 92
          Width = 128
          Height = 21
          TabStop = False
          Color = clGray
          DataField = 'DATAEFETENC'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbedTipSent: TDBEdit
          Left = 314
          Top = 151
          Width = 294
          Height = 21
          TabStop = False
          Color = clGray
          DataField = 'TIPO_SENT'
          DataSource = dsProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object tbsEtapas: TTabSheet
        Caption = 'Etapas'
        object dbGrdEtapa: TwwDBGrid
          Left = 0
          Top = 0
          Width = 733
          Height = 254
          Selected.Strings = (
            'NUMSEQ'#9'10'#9'Num. Seq.'#9'F'
            'ETAPA'#9'40'#9'Tipo de Etapa'#9'F'
            'DATAREALOCOR'#9'17'#9'Data e Hora Prev./Real'
            'ASSUNTO'#9'40'#9'Assunto Resumido')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsEtapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tbsObsEtp: TTabSheet
        Caption = 'Obs.Etapa'
        object Label25: TLabel
          Left = 81
          Top = 36
          Width = 56
          Height = 13
          Caption = 'Num.Seq.'
          FocusControl = DBEdit1
        end
        object Label26: TLabel
          Left = 150
          Top = 36
          Width = 113
          Height = 13
          Caption = 'Assunto (Resumido)'
          FocusControl = DBEdit2
        end
        object Label27: TLabel
          Left = 515
          Top = 36
          Width = 126
          Height = 13
          Caption = 'Data Prevista ou Real'
        end
        object Label29: TLabel
          Left = 81
          Top = 78
          Width = 75
          Height = 13
          Caption = 'Observações'
          FocusControl = DBMemo1
        end
        object DBEdit1: TDBEdit
          Left = 81
          Top = 51
          Width = 60
          Height = 21
          Color = clGray
          DataField = 'NUMSEQ'
          DataSource = dsEtapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 150
          Top = 51
          Width = 355
          Height = 21
          Color = clGray
          DataField = 'ASSUNTO'
          DataSource = dsEtapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 515
          Top = 51
          Width = 126
          Height = 21
          Color = clGray
          DataField = 'DATAREALOCOR'
          DataSource = dsEtapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBMemo1: TDBMemo
          Left = 81
          Top = 92
          Width = 565
          Height = 150
          Color = clGray
          DataField = 'OBSERVETAPA'
          DataSource = dsEtapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
      end
      object tbshVinculos: TTabSheet
        Caption = 'Vinculações'
        object pnlLigado: TPanel
          Left = 2
          Top = 2
          Width = 729
          Height = 48
          BevelInner = bvLowered
          Caption = 'pnlLigado'
          TabOrder = 0
          object Label37: TLabel
            Left = 48
            Top = 18
            Width = 176
            Height = 13
            Caption = 'Este Processo Está Ligado Por'
          end
          object Label38: TLabel
            Left = 457
            Top = 18
            Width = 72
            Height = 13
            Caption = 'Ao Processo'
          end
          object dbrgVinc: TDBRadioGroup
            Left = 240
            Top = 4
            Width = 185
            Height = 36
            Columns = 2
            DataField = 'FLGVINCULADO'
            DataSource = dsProcesso
            Items.Strings = (
              'Incidência'
              'Vinculação')
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
          end
          object dbedNumVinc: TDBEdit
            Left = 543
            Top = 14
            Width = 120
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'IDPROCVINCULADO'
            DataSource = dsProcesso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object gbxVinculados: TGroupBox
          Left = 2
          Top = 53
          Width = 729
          Height = 199
          Caption = 'Processos Ligados a Este'
          TabOrder = 1
          object dbgdProcessosVinc: TwwDBGrid
            Left = 7
            Top = 15
            Width = 715
            Height = 177
            Selected.Strings = (
              'NOME'#9'40'#9'Contra Parte'
              'DATAJUIZO'#9'10'#9'Data Ajuiz.'
              'DATANOTIF'#9'10'#9'Data Notif.'
              'JCJ'#9'10'#9'Junta ou Vara'
              'PROCJCJNUM'#9'15'#9'Número na 1.a Inst.'
              'PROCTRTNUM'#9'15'#9'Número na 2.a Inst.'
              'PROCTSTNUM'#9'15'#9'Número na Inst. Sup.'
              'FLGSITPROC'#9'10'#9'Encerrado?'
              'DATAEFETENC'#9'10'#9'Data Encerr.'
              'FLGVINCULADO'#9'10'#9'Vinculado?'
              'NUMPROCTRAB'#9'10'#9'Número Interno')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsProcVinc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
      end
    end
    object dbedNumero: TDBEdit
      Left = 12
      Top = 23
      Width = 120
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'NUMPROCTRAB'
      DataSource = dsProcesso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbedDataAju: TDBEdit
      Left = 12
      Top = 64
      Width = 120
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'DATAJUIZO'
      DataSource = dsProcesso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object rgSituacao: TDBRadioGroup
      Left = 295
      Top = 8
      Width = 101
      Height = 45
      Caption = 'Situação'
      DataField = 'FLGSITPROC'
      DataSource = dsProcesso
      Items.Strings = (
        'Aberto'
        'Encerrado')
      ReadOnly = True
      TabOrder = 3
      Values.Strings = (
        '0'
        '1')
    end
    object dbedDataNot: TDBEdit
      Left = 139
      Top = 64
      Width = 120
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'DATANOTIF'
      DataSource = dsProcesso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbedNumJCJ: TDBEdit
      Left = 139
      Top = 23
      Width = 148
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'PROCJCJNUM'
      DataSource = dsProcesso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object rgAtivo: TDBRadioGroup
      Left = 295
      Top = 55
      Width = 101
      Height = 45
      Caption = 'Somos a Parte'
      DataField = 'FLGPARTEATIVA'
      DataSource = dsProcesso
      Items.Strings = (
        'Ativa'
        'Passiva')
      ReadOnly = True
      TabOrder = 6
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgMateria: TDBRadioGroup
      Left = 404
      Top = 55
      Width = 333
      Height = 71
      Caption = 'Matéria'
      Columns = 2
      DataField = 'INDMATERIA'
      DataSource = dsProcesso
      Items.Strings = (
        'Trabalhista'
        'Previdenciária'
        'Previdenciária/Trab.'
        'Civil'
        'Comercial'
        'Tributária'
        'Penal')
      ReadOnly = True
      TabOrder = 7
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7')
    end
    object dbedNome: TwwDBEdit
      Left = 12
      Top = 105
      Width = 384
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'NOME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnProcurarProc: TBitBtn
      Left = 404
      Top = 16
      Width = 149
      Height = 33
      Caption = '&Processo'
      Default = True
      TabOrder = 9
      OnClick = bbtnProcurarProcClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
    object bbtnProcurarProcLitis: TBitBtn
      Left = 560
      Top = 16
      Width = 177
      Height = 33
      Hint = 
        'Procurar Contra-Parte por Nome, Incluindo Litisconsortes. (Bem M' +
        'ais Demorado)'
      Caption = '&Processo e Litisconsortes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = bbtnProcurarProcLitisClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 749
    inherited tb97Fundo: TToolbar97
      Left = 583
      DockPos = 591
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 76
    Top = 408
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object dsProcesso: TwwDataSource
    AutoEdit = False
    DataSet = CdsProcesso
    Left = 30
    Top = 247
  end
  object CdsProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 30
    Top = 233
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecionar Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contra-Parte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA  = VARAJUSTICA .IDVARAJUSTICA (+)')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 134
    Top = 408
  end
  object dsLitisconsorte: TwwDataSource
    AutoEdit = False
    DataSet = CdsLitisconsorte
    Left = 102
    Top = 247
  end
  object CdsLitisconsorte: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 102
    Top = 233
  end
  object dsObjeto: TwwDataSource
    AutoEdit = False
    DataSet = CdsObjeto
    Left = 167
    Top = 247
  end
  object CdsObjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 167
    Top = 233
  end
  object dsEtapa: TwwDataSource
    AutoEdit = False
    DataSet = CdsEtapa
    Left = 216
    Top = 247
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 233
  end
  object dsProcVinc: TwwDataSource
    AutoEdit = False
    DataSet = CdsProcVinc
    Left = 272
    Top = 247
  end
  object CdsProcVinc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 233
  end
end
