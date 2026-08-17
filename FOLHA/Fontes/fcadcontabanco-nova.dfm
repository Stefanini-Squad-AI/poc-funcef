inherited frmCadContaBanco: TfrmCadContaBanco
  Left = 91
  Top = 148
  Caption = 'Conta Bancária '
  ClientHeight = 371
  ClientWidth = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 624
    Height = 285
    inherited pnlMestre: TPanel
      Width = 614
      Height = 50
      object Label1: TLabel
        Left = 8
        Top = 3
        Width = 42
        Height = 13
        Caption = 'Pessoa'
      end
      object lblCPF: TLabel
        Left = 371
        Top = 3
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object lblDataNasc: TLabel
        Left = 499
        Top = 3
        Width = 65
        Height = 13
        Caption = 'Data Nasc.'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 17
        Width = 347
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dbedCPF: TDBEdit
        Left = 371
        Top = 17
        Width = 121
        Height = 21
        Color = clSilver
        DataField = 'NUMDOCUMENTO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbedDataNasc: TDBEdit
        Left = 499
        Top = 17
        Width = 108
        Height = 21
        Color = clSilver
        DataField = 'DATANASC'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 55
      Width = 614
      Height = 225
      Tabs.Strings = (
        'Contas Bancárias')
      inherited pgctrlDetalhe: TPageControl
        Width = 516
        Height = 166
        inherited tbsDet: TTabSheet
          Caption = 'Contas Bancárias'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 508
            Height = 138
            Selected.Strings = (
              'NOMEBANCO'#9'25'#9'Banco'
              'NOMEAGENCIA'#9'18'#9'Agência'
              'CONTACORRENTE'#9'15'#9'Conta Corrente'
              'DESCTIPO'#9'14'#9'Tipo'
              'FLGCONTAPREF'#9'10'#9'Pref.'
              'NUMBANCO'#9'10'#9'NUMBANCO')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 508
            Height = 138
            object rgrpTipoConta: TDBRadioGroup
              Left = 368
              Top = -1
              Width = 137
              Height = 60
              Caption = 'Tipo'
              DataField = 'TIPOCONTA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Conta Corrente'
                'Conta Salário'
                'Poupança')
              ParentFont = False
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                '1'
                '2'
                '3')
            end
            object dbgrpContaPref: TDBRadioGroup
              Left = 368
              Top = 61
              Width = 137
              Height = 36
              Caption = 'Conta Preferencial'
              Columns = 2
              DataField = 'FLGCONTAPREF'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                '0'
                '1')
              OnChange = dbgrpContaPrefChange
            end
            object dbgrpContaConj: TDBRadioGroup
              Left = 368
              Top = 97
              Width = 137
              Height = 36
              Caption = 'Conta Conjunta'
              Columns = 2
              DataField = 'FLGCONTACONJUNTA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                'N'
                'S')
            end
            object GroupBox1: TGroupBox
              Left = 1
              Top = 0
              Width = 363
              Height = 133
              TabOrder = 0
              object Label6: TLabel
                Left = 71
                Top = 10
                Width = 37
                Height = 13
                Caption = 'Banco'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 71
                Top = 53
                Width = 47
                Height = 13
                Caption = 'Agência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 71
                Top = 92
                Width = 88
                Height = 13
                Caption = 'Conta Bancária'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 4
                Top = 10
                Width = 55
                Height = 13
                Caption = 'Banco Nº'
              end
              object Label5: TLabel
                Left = 4
                Top = 53
                Width = 65
                Height = 13
                Caption = 'Agência Nº'
              end
              object dbedContaBancaria: TDBEdit
                Left = 71
                Top = 106
                Width = 121
                Height = 21
                DataField = 'CONTACORRENTE'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnExit = dbedContaBancariaExit
              end
              object dblkpcmbBanco: TwwDBLookupCombo
                Left = 71
                Top = 24
                Width = 280
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BANCO'#9'60'#9'Banco'
                  'NUMBANCO'#9'10'#9'Nº')
                DataField = 'IDBANCO'
                DataSource = dsDet
                LookupTable = qryBanco
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = dblkpcmbBancoCloseUp
              end
              object dblkpcmbAgencia: TwwDBLookupCombo
                Left = 71
                Top = 68
                Width = 280
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'AGENCIA'#9'60'#9'AGENCIA'
                  'NUMAGENCIA'#9'15'#9'NUMAGENCIA')
                DataField = 'IDAGENCIA'
                DataSource = dsDet
                LookupTable = qryAgencia
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = dblkpcmbAgenciaCloseUp
              end
              object edDigBanco: TEditNum
                Left = 4
                Top = 24
                Width = 64
                Height = 21
                Hint = 'Digite este campo caso deseje procurar o banco por número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnExit = edDigBancoExit
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
              object edDigAgencia: TEditNum
                Left = 4
                Top = 68
                Width = 64
                Height = 21
                Hint = 'Digite este campo caso deseje procurar a agência por número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnExit = edDigAgenciaExit
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
              object medConta: TMaskEdit
                Left = 208
                Top = 104
                Width = 121
                Height = 21
                TabOrder = 5
                Text = 'medConta'
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 606
      end
      inherited Dock974: TDock97
        Left = 520
        Height = 166
      end
    end
  end
  inherited Dock972: TDock97
    Width = 624
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 624
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, PF.DATANASC, P.NUMDOCUMENTO'
      'FROM   PESSOA P, PESSOAFISICA PF'
      'WHERE  (P.IDPESSOA      = :IDPESSOA)'
      'AND        (PF.IDPESSOA    = P.IDPESSOA)'
      '')
    Left = 280
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryDATANASC: TDateTimeField
      FieldName = 'DATANASC'
      Origin = 'PESSOAFISICA.DATANASC'
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'PESSOA.NUMDOCUMENTO'
      Size = 18
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 364
    Top = 5
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 532
    Top = 5
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, NOME)'
      'values'
      '  (:IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NOME = :OLD_NOME')
    Left = 308
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOAFISICA.DATANASC')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição'
      'CPF'
      'Pessoa'
      'Data de Nascimento')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOAFISICA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'VW_RECEBEDOR')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'VW_RECEBEDOR.IDTITULAR')
    Filtro.Strings = (
      'ELEGPATRO.IDPESSOA = VW_RECEBEDOR.IDTITULAR '
      'PARTPREVPLAN.IDPESSOA = VW_RECEBEDOR.IDTITULAR'
      'PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'PESSOA.IDPESSOA = VW_RECEBEDOR.IDRECEBEDOR'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '13'
      '15'
      '60'
      '10')
    Left = 588
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 252
    Top = 5
  end
  inherited ImlPadrao: TImageList
    Left = 560
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 336
    Top = 5
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 448
    Top = 5
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterEdit = qryDetAfterEdit
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.NUMBANCO,CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA' +
        ', CB.FLGCONTAPREF,'
      
        '       CB.IDPESSOA, CB.TIPOCONTA, CB.FLGCONTACONJUNTA, AB.IDBANC' +
        'O,'
      '       AB.NUMAGENCIA, A.NOME AS NOMEAGENCIA,'
      '       B.NOME AS NOMEBANCO,'
      
        '       DECODE(CB.TIPOCONTA, 1, '#39'Conta Corrente'#39', 2, '#39'Conta Salár' +
        'io'#39','
      '              3, '#39'Poupança'#39') AS DESCTIPO'
      
        'FROM CONTABANCARIA CB, AGENCIABANCARIA AB, PESSOA A, PESSOA B, B' +
        'ANCO C'
      'WHERE (CB.IDPESSOA  = :IDPESSOA)'
      'AND (CB.IDAGENCIA = AB.IDPESSOA(+))'
      'AND (A.IDPESSOA(+) = CB.IDAGENCIA)'
      'AND (B.IDPESSOA(+) = AB.IDBANCO) '
      'AND (AB.IDBANCO    = C.IDPESSOA(+))   '
      ''
      ' '
      ''
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 392
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetNOMEBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 25
      FieldName = 'NOMEBANCO'
      Size = 60
    end
    object qryDetNOMEAGENCIA: TStringField
      DisplayLabel = 'Agência'
      DisplayWidth = 18
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object qryDetCONTACORRENTE: TStringField
      DisplayLabel = 'Conta Corrente'
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryDetDESCTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 14
      FieldName = 'DESCTIPO'
      Size = 14
    end
    object qryDetFLGCONTAPREF: TFloatField
      DisplayLabel = 'Pref.'
      DisplayWidth = 10
      FieldName = 'FLGCONTAPREF'
    end
    object qryDetNUMBANCO: TStringField
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryDetIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Visible = False
    end
    object qryDetIDAGENCIA: TFloatField
      FieldName = 'IDAGENCIA'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Visible = False
      Size = 1
    end
    object qryDetIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Visible = False
    end
    object qryDetFLGCONTACONJUNTA: TStringField
      FieldName = 'FLGCONTACONJUNTA'
      Visible = False
      Size = 1
    end
    object qryDetNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Visible = False
      FixedChar = True
      Size = 15
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABANCARIA'
      'set'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  IDPESSOA = :IDPESSOA,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  FLGCONTACONJUNTA = :FLGCONTACONJUNTA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    InsertSQL.Strings = (
      'insert into CONTABANCARIA'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ', '
      'TIPOCONTA, '
      '   FLGCONTACONJUNTA)'
      'values'
      '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, '
      ':IDPESSOA, '
      '   :TIPOCONTA, :FLGCONTACONJUNTA)')
    DeleteSQL.Strings = (
      'delete from CONTABANCARIA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 420
    Top = 5
  end
  object qryBanco: TwwQuery
    Tag = 5
    AfterScroll = qryBancoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDPESSOA, P.NOME AS BANCO, B.NUMBANCO, B.MASCARACC'
      'FROM BANCO B, PESSOA P'
      'WHERE B.IDPESSOA = P.IDPESSOA'
      ' ')
    ValidateWithMask = True
    Left = 476
    Top = 5
  end
  object qryAgencia: TwwQuery
    Tag = 5
    AfterScroll = qryAgenciaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA,'
      '               AGENCIABANCARIA.NUMAGENCIA,'
      '               AGENCIABANCARIA.IDBANCO'
      'FROM AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE AGENCIABANCARIA.IDBANCO = :pIdBanco'
      'AND AGENCIABANCARIA.IDPESSOA = AGENCIA.IDPESSOA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 504
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
end
