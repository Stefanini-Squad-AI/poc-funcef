inherited frmCadLayOutRecebimentoPatro: TfrmCadLayOutRecebimentoPatro
  Left = 366
  Top = 113
  HelpContext = 320004
  Caption = 'Cadastro de Lay-Out de Arquivos de Recebimento da Patrocinadora'
  ClientHeight = 457
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 371
    inherited pnlMestre: TPanel
      Width = 761
      Height = 47
      object Label1: TLabel
        Left = 9
        Top = 4
        Width = 124
        Height = 13
        Caption = 'Descrição do Lay-Out'
      end
      object DbeDescricao: TwwDBEdit
        Left = 9
        Top = 18
        Width = 413
        Height = 21
        Color = clWhite
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 48
      Width = 761
      Height = 322
      Tabs.Strings = (
        'Opções do Lay-Out'
        'Detalhe')
      detdbGrids.Strings = (
        ''
        'dbgrdDet')
      inherited pgctrlDetalhe: TPageControl
        Width = 663
        Height = 263
        object tbsOpcoes: TTabSheet [0]
          Caption = 'Opções do Lay-Out'
          ImageIndex = 1
          object Label7: TLabel
            Left = 6
            Top = 8
            Width = 392
            Height = 13
            Caption = 'Quando houver registros duplicados com mesmo codigo de provento '
          end
          object Label8: TLabel
            Left = 6
            Top = 45
            Width = 127
            Height = 13
            Caption = 'Histórico de Rubricas '
          end
          object dblkpcmbOpcaoRegDuplicado: TCMDBLookupCombo
            Left = 6
            Top = 22
            Width = 392
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'32'#9#9'F')
            DataField = 'CODPROVDUPLO'
            DataSource = ds
            LookupTable = qryOpcaoRegDuplicado
            LookupField = 'CODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object CMDBLookupCombo1: TCMDBLookupCombo
            Left = 6
            Top = 58
            Width = 392
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'32'#9#9'F')
            DataField = 'FLGGRAVAHIST'
            DataSource = ds
            LookupTable = qryOpcaoGravaHistRub
            LookupField = 'CODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbcRubricaAtraso: TDBCheckBox
            Left = 6
            Top = 180
            Width = 469
            Height = 17
            Caption = 
              'Não havendo mês de referência, considerar como mês imediatamente' +
              ' anterior.'
            DataField = 'FLGRUBATMANT'
            DataSource = ds
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GroupBox1: TGroupBox
            Left = 400
            Top = 7
            Width = 245
            Height = 123
            Caption = 'Cálculo de Salário'
            TabOrder = 3
            object Label2: TLabel
              Left = 8
              Top = 15
              Width = 196
              Height = 13
              Caption = 'Receber o Salário de Participação'
            end
            object dblkpOpcaoSalario: TCMDBLookupCombo
              Left = 8
              Top = 28
              Width = 229
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'32'#9#9'F')
              DataField = 'FLGCALCSALPART'
              DataSource = ds
              LookupTable = qryOpcaoSalario
              LookupField = 'CODIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object gbTipoDec: TGroupBox
              Left = 8
              Top = 50
              Width = 229
              Height = 69
              Caption = ' Tipo de Decimal'
              TabOrder = 1
              object lblNumDec: TLabel
                Left = 148
                Top = 17
                Width = 57
                Height = 13
                Caption = 'Num.Dec.'
              end
              object dbrgTipoDec: TDBRadioGroup
                Left = 8
                Top = 11
                Width = 134
                Height = 54
                Caption = 'Separador Decimal'
                DataField = 'FLGTIPOSEPARADEC'
                DataSource = ds
                Items.Strings = (
                  '&Ponto'
                  '&Vírgula'
                  '&Sem Separador')
                TabOrder = 0
                Values.Strings = (
                  'P'
                  'V'
                  'N')
              end
              object dbreNumDec: TDBRealEdit
                Left = 148
                Top = 33
                Width = 54
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                MaxLength = 2
                TabOrder = 1
                WordWrap = False
                IntDigits = 2
                DecDigits = 0
                NumberFormat = iNumber
                Signal = False
                DataField = 'NUMCASASDEC'
                DataSource = ds
              end
            end
          end
          object dbgrpChave: TDBRadioGroup
            Left = 6
            Top = 84
            Width = 245
            Height = 41
            Caption = ' Identificador do Participante '
            Columns = 2
            DataField = 'IDPARTRUBRICA'
            DataSource = ds
            Items.Strings = (
              'Matricula'
              'Inscrição')
            TabOrder = 4
            Values.Strings = (
              '0'
              '1')
          end
          object rdgrpOpMat: TDBRadioGroup
            Left = 6
            Top = 131
            Width = 599
            Height = 44
            Caption = 'Opções de matrícula - (Considerar apenas parte sem DV)'
            DataField = 'FLGMATCOMPLETA'
            DataSource = ds
            Items.Strings = (
              
                'A matrícula não está no sistema como vem no  arquivo. Ex: Arquiv' +
                'o-> 0003451 / Cadastro-> 3451'
              
                'A matrícula está no sistema como vem no arquivo. Ex: Arquivo-> 0' +
                '003451 / Cadastro-> 0003451')
            TabOrder = 5
            Values.Strings = (
              '0'
              '1')
          end
          object DBCheckBox1: TDBCheckBox
            Left = 6
            Top = 197
            Width = 268
            Height = 17
            Caption = 'O arquivo possui linha de cabeçalho'
            DataField = 'FLGHEADER'
            DataSource = ds
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 6
            Top = 213
            Width = 271
            Height = 17
            Caption = 'O arquivo possui linha de rodapé'
            DataField = 'FLGFOOTER'
            DataSource = ds
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 655
            Height = 235
            Selected.Strings = (
              'IDENTIFICADOR'#9'5'#9'Id.'
              'ORDEM'#9'5'#9'Ordem'
              'DESCRICAO'#9'50'#9'Descrição'
              'TAMANHO'#9'5'#9'Tam.'
              'FORMATO'#9'10'#9'Formato'
              'CONTEUDO'#9'30'#9'Conteúdo'
              'CAMPO'#9'60'#9'Campo'#9'F'
              'TIPO'#9'20'#9'Tipo'
              'LINHA'#9'10'#9'Linha')
            FixedCols = 2
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 655
            Height = 235
            object pnlControles: TPanel
              Left = 0
              Top = 0
              Width = 655
              Height = 235
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 0
              TabStop = True
              object Ordem: TLabel
                Left = 8
                Top = 36
                Width = 37
                Height = 13
                Caption = 'Ordem'
              end
              object Tipo: TLabel
                Left = 433
                Top = 36
                Width = 26
                Height = 13
                Caption = 'Tipo'
              end
              object Label4: TLabel
                Left = 8
                Top = 89
                Width = 55
                Height = 13
                Caption = 'Conteúdo'
              end
              object Tamanho: TLabel
                Left = 208
                Top = 36
                Width = 53
                Height = 13
                Caption = 'Tamanho'
              end
              object Label5: TLabel
                Left = 8
                Top = 116
                Width = 58
                Height = 13
                Caption = 'Descrição'
                WordWrap = True
              end
              object Formato: TLabel
                Left = 8
                Top = 63
                Width = 46
                Height = 13
                Caption = 'Formato'
              end
              object Label10: TLabel
                Left = 8
                Top = 9
                Width = 39
                Height = 13
                Caption = 'Campo'
              end
              object dblookupTipo: TwwDBComboBox
                Left = 462
                Top = 36
                Width = 121
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = False
                AllowClearKey = False
                DataField = 'TIPO'
                DataSource = dsDet
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Numérico '
                  'String'
                  'Data '
                  'Constante'
                  'zerados'
                  'noves'
                  'vazios')
                Sorted = False
                TabOrder = 3
                UnboundDataType = wwDefault
              end
              object dbDescricao: TwwDBEdit
                Left = 69
                Top = 111
                Width = 514
                Height = 21
                DataField = 'DESCRICAO'
                DataSource = dsDet
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbFormato: TwwDBEdit
                Left = 69
                Top = 60
                Width = 121
                Height = 21
                DataField = 'FORMATO'
                DataSource = dsDet
                TabOrder = 4
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbConteudo: TwwDBEdit
                Left = 69
                Top = 86
                Width = 514
                Height = 21
                DataField = 'CONTEUDO'
                DataSource = dsDet
                TabOrder = 5
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbTamanho: TDBRealEdit
                Left = 266
                Top = 36
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 2
                WordWrap = False
                OnExit = dbTamanhoExit
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fFixed
                Signal = False
                DataField = 'TAMANHO'
                DataSource = dsDet
              end
              object dbOrdem: TDBRealEdit
                Left = 69
                Top = 36
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 1
                WordWrap = False
                OnExit = dbOrdemExit
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fFixed
                Signal = False
                DataField = 'ORDEM'
                DataSource = dsDet
              end
              object dblookupCampo: TCMDBLookupCombo
                Left = 69
                Top = 9
                Width = 514
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome')
                DataField = 'IDCAMPO'
                DataSource = dsDet
                LookupTable = qryCampos
                LookupField = 'IDCAMPO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dbckValor: TDBCheckBox
                Left = 433
                Top = 58
                Width = 73
                Height = 17
                Caption = 'É valor.'
                DataField = 'FLGVALOR'
                DataSource = dsDet
                TabOrder = 7
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbckValorClick
              end
              object dbckSeparador: TDBCheckBox
                Left = 433
                Top = 70
                Width = 161
                Height = 17
                Caption = 'Usa separador decimal.'
                DataField = 'FLGSEPARADOR'
                DataSource = dsDet
                TabOrder = 8
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 753
      end
      inherited Dock974: TDock97
        Left = 667
        Height = 263
      end
    end
  end
  inherited Dock972: TDock97
    Width = 763
  end
  inherited Dock971: TDock97
    Top = 418
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 571
      DockPos = 571
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 386
      DockPos = 386
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 745
    Top = 435
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 542
    Top = 65534
  end
  inherited ds: TwwDataSource
    Left = 357
    Top = 65534
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.LAYOUTENVIO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPO = :TIPO,'
      '  CODPROVDUPLO = :CODPROVDUPLO,'
      '  FLGCALCSALPART = :FLGCALCSALPART,'
      '  FLGTIPOSEPARADEC = :FLGTIPOSEPARADEC,'
      '  NUMCASASDEC = :NUMCASASDEC,'
      '  FLGGRAVAHIST = :FLGGRAVAHIST,'
      '  FLGRUBATMANT = :FLGRUBATMANT,'
      '  FLGHEADER = :FLGHEADER,'
      '  FLGFOOTER = :FLGFOOTER,'
      '  FLGMATCOMPLETA = :FLGMATCOMPLETA,'
      '  IDPARTRUBRICA = :IDPARTRUBRICA'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO')
    InsertSQL.Strings = (
      'insert into CM.LAYOUTENVIO'
      
        '  (IDLAYOUTENVIO, DESCRICAO, TIPO, CODPROVDUPLO, FLGCALCSALPART,' +
        ' FLGTIPOSEPARADEC, '
      
        '   NUMCASASDEC, FLGGRAVAHIST, FLGRUBATMANT, FLGHEADER, FLGFOOTER' +
        ', FLGMATCOMPLETA, '
      '   IDPARTRUBRICA)'
      'values'
      
        '  (:IDLAYOUTENVIO, :DESCRICAO, :TIPO, :CODPROVDUPLO, :FLGCALCSAL' +
        'PART, :FLGTIPOSEPARADEC, '
      
        '   :NUMCASASDEC, :FLGGRAVAHIST, :FLGRUBATMANT, :FLGHEADER, :FLGF' +
        'OOTER, '
      '   :FLGMATCOMPLETA, :IDPARTRUBRICA)')
    DeleteSQL.Strings = (
      'delete from CM.LAYOUTENVIO'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO')
    Left = 403
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona layout de envio'
    Colunas.Strings = (
      'LAYOUTENVIO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Layout')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CM.LAYOUTENVIO')
    CamposChave.Strings = (
      'LAYOUTENVIO.IDLAYOUTENVIO')
    Filtro.Strings = (
      'TIPO = '#39'R'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    ExibePergunta = False
    Left = 634
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 745
    Top = 435
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 265
    Top = 65534
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      
        '  IDLAYOUTENVIO,    DESCRICAO,   TIPO, CODPROVDUPLO,   FLGCALCSA' +
        'LPART,'
      '  FLGTIPOSEPARADEC, NUMCASASDEC, FLGGRAVAHIST,   FLGRUBATMANT,'
      '  FLGHEADER,        FLGFOOTER,   FLGMATCOMPLETA, IDPARTRUBRICA'
      'FROM'
      '  CM.LAYOUTENVIO'
      'WHERE'
      '  IDLAYOUTENVIO = :IDLAYOUTENVIO'
      'AND TIPO = '#39'R'#39
      ' '
      ' '
      ' '
      ' ')
    Left = 311
    Top = 65534
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 449
    Top = 65534
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PARAMENVIO.IDLAYOUTENVIO, PARAMENVIO.SEQUENCIA,'
      '  PARAMENVIO.ORDEM,     PARAMENVIO.TIPO,'
      
        '  PARAMENVIO.IDCAMPO,'#9'PARAMENVIO.CONTEUDO,'#9'PARAMENVIO.TAMANHO,  ' +
        'PARAMENVIO.IDENTIFICADOR,'
      '  PARAMENVIO.DESCRICAO,'#9'PARAMENVIO.LINHA,'#9'PARAMENVIO.FORMATO,'
      '  PARAMENVIO.FLGVALOR,  PARAMENVIO.FLGSEPARADOR,'
      ''
      '  CAMPOINTERFENVIO.NOME'#9'AS CAMPO'
      ''
      'FROM'
      '  PARAMENVIO, CAMPOINTERFENVIO'
      ''
      'WHERE'
      '  (PARAMENVIO.IDLAYOUTENVIO = :IDLAYOUTENVIO)   AND'
      '  (PARAMENVIO.IDCAMPO       = CAMPOINTERFENVIO.IDCAMPO)'
      'ORDER BY'
      '  IDENTIFICADOR, ORDEM'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 496
    Top = 65534
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMENVIO'
      'set'
      '  SEQUENCIA = :SEQUENCIA,'
      '  ORDEM = :ORDEM,'
      '  TIPO = :TIPO,'
      '  IDCAMPO = :IDCAMPO,'
      '  CONTEUDO = :CONTEUDO,'
      '  TAMANHO = :TAMANHO,'
      '  IDENTIFICADOR = :IDENTIFICADOR,'
      '  DESCRICAO = :DESCRICAO,'
      '  LINHA = :LINHA,'
      '  FORMATO = :FORMATO,'
      '  FLGVALOR = :FLGVALOR,'
      '  FLGSEPARADOR = :FLGSEPARADOR'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO and'
      '  ORDEM = :OLD_ORDEM'
      ' ')
    InsertSQL.Strings = (
      'insert into PARAMENVIO'
      
        '  (IDLAYOUTENVIO, SEQUENCIA, ORDEM, TIPO, IDCAMPO, CONTEUDO, TAM' +
        'ANHO, IDENTIFICADOR, '
      '   DESCRICAO, LINHA, FORMATO, FLGVALOR, FLGSEPARADOR)'
      'values'
      
        '  (:IDLAYOUTENVIO, :SEQUENCIA, :ORDEM, :TIPO, :IDCAMPO, :CONTEUD' +
        'O, :TAMANHO, '
      
        '   :IDENTIFICADOR, :DESCRICAO, :LINHA, :FORMATO, :FLGVALOR, :FLG' +
        'SEPARADOR)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PARAMENVIO'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO and'
      '  ORDEM = :OLD_ORDEM')
    Left = 588
    Top = 65534
  end
  object qryCampos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'IDCAMPO,'
      #9'NOME'
      ''
      'FROM'#9'CAMPOINTERFENVIO'
      'WHERE TIPO = '#39'R'#39
      'ORDER'#9'BY NOME'
      ' ')
    ControlType.Strings = (
      'NOME;CustomEdit;')
    ValidateWithMask = True
    Left = 680
    Top = 65534
    object qryCamposIDCAMPO: TFloatField
      FieldName = 'IDCAMPO'
      Origin = 'CAMPOINTERFENVIO.IDCAMPO'
    end
    object qryCamposNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'CAMPOINTERFENVIO.NOME'
      Size = 60
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 726
    Top = 65534
  end
  object qryOpcaoSalario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'C'#39' AS CODIGO, '#39'Composto por rubricas do arquivo'#39' AS DESC' +
        'RICAO FROM DUAL UNION'
      
        'SELECT '#39'I'#39' AS CODIGO, '#39'Descriminado em uma coluna'#39' AS DESCRICAO ' +
        'FROM DUAL UNION'
      
        'SELECT '#39'N'#39' AS CODIGO, '#39'Composto por apenas uma rubrica'#39' AS DESCR' +
        'ICAO FROM DUAL'
      ' ')
    ValidateWithMask = True
    Left = 732
    Top = 49
  end
  object qryOpcaoRegDuplicado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'0'#39' AS CODIGO, '#39'Acumula Valor do Provento de todos os reg' +
        'istros com mesmo código de Provento.'#39' AS DESCRICAO FROM DUAL UNI' +
        'ON'
      
        'SELECT '#39'1'#39' AS CODIGO, '#39'Gera log de erros dos registros duplicado' +
        's assumindo como correto o 1o.'#39' AS DESCRICAO FROM DUAL UNION'
      
        'SELECT '#39'2'#39' AS CODIGO, '#39'Desconsidera e Gera log de erros para tod' +
        'os os registros duplicados.'#39' AS DESCRICAO FROM DUAL'
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 729
    Top = 94
  end
  object qryOpcaoGravaHistRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'0'#39' AS CODIGO, '#39'Não gravar rubricas com histórico próprio' +
        #39' AS DESCRICAO FROM DUAL UNION'
      
        'SELECT '#39'1'#39' AS CODIGO, '#39'Grava todas as Rubricas'#39' AS DESCRICAO FRO' +
        'M DUAL'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 738
    Top = 139
  end
end
