inherited frmExecBuscaSolicitante: TfrmExecBuscaSolicitante
  Left = 273
  Top = 134
  Caption = 'Seleciona'
  ClientHeight = 415
  ClientWidth = 646
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 646
    Height = 382
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 646
      Height = 382
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControlChange
      object TabSheet1: TTabSheet
        Caption = 'Condições'
        object Panel1: TPanel
          Left = 0
          Top = 320
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 0
          object Label11: TLabel
            Left = 13
            Top = 11
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object cboPlano: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtPlano: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkPlano: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 288
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 1
          object Label10: TLabel
            Left = 13
            Top = 11
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object cboPatro: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtPatro: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkPatro: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 256
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 2
          object Label9: TLabel
            Left = 13
            Top = 11
            Width = 105
            Height = 13
            Caption = 'Situação no Plano'
          end
          object cboSituacaoPlano: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtSitPlano: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkSitPlano: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 224
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 3
          object Label8: TLabel
            Left = 13
            Top = 11
            Width = 129
            Height = 13
            Caption = 'Situação na Fundação'
          end
          object cboSituacaoFund: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtSituacao: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkSitFund: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 192
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 4
          object Label7: TLabel
            Left = 13
            Top = 11
            Width = 86
            Height = 13
            Caption = 'CPF. do Titular'
          end
          object cboCPFTIT: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtCPFTit: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkCPFTit: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            TabOrder = 2
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 160
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 5
          object Label6: TLabel
            Left = 13
            Top = 11
            Width = 73
            Height = 13
            Caption = 'Nome Titular'
          end
          object cboNomeTitular: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtNomeTit: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkNomeTit: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            TabOrder = 2
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 128
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 6
          object Label5: TLabel
            Left = 13
            Top = 11
            Width = 36
            Height = 13
            Caption = 'C.P.F.'
          end
          object cboCPF: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtCPF: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkCPF: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 96
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 7
          object Label4: TLabel
            Left = 13
            Top = 11
            Width = 87
            Height = 13
            Caption = 'Inscrição Prev.'
          end
          object cboInscricao: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtInscricaoPrev: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkInscricao: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            TabOrder = 2
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 64
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 8
          object Label3: TLabel
            Left = 13
            Top = 11
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object cboMatricula: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'é igual a'
              'começa com'
              'possui o texto'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a')
          end
          object edtMatricula: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkMatricula: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            TabOrder = 2
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 32
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 9
          Visible = False
          object Label2: TLabel
            Left = 13
            Top = 11
            Width = 70
            Height = 13
            Caption = 'Matr. Titular'
          end
          object cboMatrTit: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtMatrTit: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkMatrTit: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            TabOrder = 2
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 638
          Height = 32
          Align = alTop
          TabOrder = 10
          object Label1: TLabel
            Left = 13
            Top = 11
            Width = 33
            Height = 13
            Caption = 'Nome'
          end
          object cboNome: TComboBox
            Left = 160
            Top = 7
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'possui o texto'
              'é igual a'
              'é menor que'
              'é maior que'
              'é menor ou igual a'
              'é maior ou igual a'
              '')
          end
          object edtNome: TEdit
            Left = 319
            Top = 6
            Width = 258
            Height = 21
            TabOrder = 1
          end
          object chkNome: TCheckBox
            Left = 584
            Top = 8
            Width = 45
            Height = 17
            Caption = 'A=a'
            TabOrder = 2
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 636
          Height = 352
          Selected.Strings = (
            'NOME'#9'44'#9'Nome'
            'MATRICULA_TIT'#9'12'#9'Matr. Titular'
            'MATRICULA'#9'11'#9'Matrícula'
            'TIPO'#9'16'#9'Tipo'
            'INSCRICAO_TIT'#9'12'#9'Inscrição Prev.'
            'CPF'#9'18'#9'C.P.F.'
            'NOME_TIT'#9'60'#9'Nome Titular'
            'CPF_TIT'#9'18'#9'C.P.F. Titular'
            'SIT_PART'#9'50'#9'Situação'
            'SIT_PLANO'#9'50'#9'Situação no Plano'
            'NOME_PATRO'#9'60'#9'Patrocinadora'
            'NOME_PLANO'#9'50'#9'Plano')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsResultado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          OnKeyDown = wwDBGrid1KeyDown
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 646
    inherited tb97Fundo: TToolbar97
      Left = 474
      DockPos = 555
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 221
      DockPos = 302
      inherited ToolbarSep971: TToolbarSep97
        Left = 164
      end
      inherited ToolbarSep973: TToolbarSep97
        Left = 247
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 0
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 83
        Caption = '&Buscar'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 166
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
      object btnOK: TBitBtn
        Left = 2
        Top = 0
        Width = 81
        Height = 27
        Caption = '&OK'
        Default = True
        TabOrder = 2
        Visible = False
        OnClick = btnOKClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object qryResultado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NO' +
        'ME,'
      '   ELP.MATRICULA AS MATRICULA_TIT,'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39#39', DEP.IDPESSOA, ELP.MATRICULA, ' +
        'DEP.MATRICULA) AS MATRICULA,'
      '   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,'
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUM' +
        'DOCUMENTO) AS CPF,'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39'Não Participante'#39', DEP.IDPESSOA,' +
        ' '#39'Participante'#39', '#39'Dependente'#39') AS TIPO,'
      '   PEP.NOME AS NOME_TIT,'
      '   PEP.NUMDOCUMENTO AS CPF_TIT,'
      '   SIP.DESCRICAO AS SIT_PART,'
      '   SPP.DESCRICAO AS SIT_PLANO,'
      '   PPA.NOME AS NOME_PATRO,'
      '   PLP.NOME AS NOME_PLANO,'
      '   DEP.IDPESSOA AS C12,'
      '   DEP.IDTITULAR AS C13,'
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS C1' +
        '4,'
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUM' +
        'DOCUMENTO) AS C15,'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39#39', DEP.IDPESSOA, ELP.MATRICULA, ' +
        'DEP.MATRICULA) AS C16,'
      '   PEP.NOME AS C17,'
      '   PEP.NUMDOCUMENTO AS C18,'
      '   ELP.MATRICULA AS C19,'
      '   PPP.INSCRICAONUMERO AS C20,'
      '   PPA.NOME AS C21,'
      '   PLP.NOME AS C22,'
      '   ELP.IDPESSJUR AS C23,'
      '   PPP.IDPLANOPREV AS C24,'
      '   SIP.DESCRICAO AS C25,'
      '   SIP.IDSITPART AS C26,'
      '   SPP.DESCRICAO AS C27,'
      '   SIP.FLGINTERNO AS C28'
      'FROM'
      '   PESSOA       PDP,'
      '   PESSOA       PEP,'
      '   PESSOA       PPA,'
      '   DEPENTIT     DEP,'
      '   ELEGPATRO    ELP,'
      '   PARTPREVPLAN PPP,'
      '   PLANPREV     PLP,'
      '   SITPART      SIP,'
      '   SITPLANOPREV SPP'
      'WHERE'
      '   ( ELP.IDPESSOA       = PEP.IDPESSOA ) AND'
      '   ( ELP.IDPESSJUR      = PPA.IDPESSOA ) AND'
      '   ( ELP.IDPESSJUR      = PPP.IDPESSJUR ) AND'
      '   ( ELP.IDPESSOA       = PPP.IDPESSOA ) AND'
      '   ( ELP.IDPESSOA       = DEP.IDTITULAR(+) ) AND'
      '   ( DEP.IDPESSOA       = PDP.IDPESSOA(+) ) AND'
      '   ( PPP.IDPLANOPREV    = PLP.IDPLANOPREV ) AND'
      '   ( PPP.IDSITPART      = SIP.IDSITPART ) AND'
      '   ( PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV(+) ) AND'
      '   PPP.FLGDESATIVADO    = 0')
    ValidateWithMask = True
    Left = 416
    Top = 104
    object qryResultadoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 44
      FieldName = 'NOME'
      Size = 60
    end
    object qryResultadoMATRICULA_TIT: TStringField
      DisplayLabel = 'Matr. Titular'
      DisplayWidth = 12
      FieldName = 'MATRICULA_TIT'
      Size = 13
    end
    object qryResultadoMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 11
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryResultadoTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 16
      FieldName = 'TIPO'
      Size = 16
    end
    object qryResultadoINSCRICAO_TIT: TFloatField
      DisplayLabel = 'Inscrição Prev.'
      DisplayWidth = 12
      FieldName = 'INSCRICAO_TIT'
    end
    object qryResultadoCPF: TStringField
      DisplayLabel = 'C.P.F.'
      DisplayWidth = 18
      FieldName = 'CPF'
      Size = 18
    end
    object qryResultadoNOME_TIT: TStringField
      DisplayLabel = 'Nome Titular'
      DisplayWidth = 60
      FieldName = 'NOME_TIT'
      Size = 60
    end
    object qryResultadoCPF_TIT: TStringField
      DisplayLabel = 'C.P.F. Titular'
      DisplayWidth = 18
      FieldName = 'CPF_TIT'
      FixedChar = True
      Size = 18
    end
    object qryResultadoSIT_PART: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 50
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryResultadoSIT_PLANO: TStringField
      DisplayLabel = 'Situação no Plano'
      DisplayWidth = 50
      FieldName = 'SIT_PLANO'
      Size = 50
    end
    object qryResultadoNOME_PATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object qryResultadoNOME_PLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'NOME_PLANO'
      Size = 50
    end
    object qryResultadoC12: TFloatField
      DisplayWidth = 10
      FieldName = 'C12'
      Visible = False
    end
    object qryResultadoC13: TFloatField
      DisplayWidth = 10
      FieldName = 'C13'
      Visible = False
    end
    object qryResultadoC14: TStringField
      DisplayWidth = 60
      FieldName = 'C14'
      Visible = False
      Size = 60
    end
    object qryResultadoC15: TStringField
      DisplayWidth = 18
      FieldName = 'C15'
      Visible = False
      Size = 18
    end
    object qryResultadoC16: TStringField
      DisplayWidth = 15
      FieldName = 'C16'
      Visible = False
      Size = 15
    end
    object qryResultadoC17: TStringField
      DisplayWidth = 60
      FieldName = 'C17'
      Visible = False
      Size = 60
    end
    object qryResultadoC18: TStringField
      DisplayWidth = 18
      FieldName = 'C18'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryResultadoC19: TStringField
      DisplayWidth = 13
      FieldName = 'C19'
      Visible = False
      Size = 13
    end
    object qryResultadoC20: TFloatField
      DisplayWidth = 10
      FieldName = 'C20'
      Visible = False
    end
    object qryResultadoC21: TStringField
      DisplayWidth = 60
      FieldName = 'C21'
      Visible = False
      Size = 60
    end
    object qryResultadoC22: TStringField
      DisplayWidth = 50
      FieldName = 'C22'
      Visible = False
      Size = 50
    end
    object qryResultadoC23: TFloatField
      DisplayWidth = 10
      FieldName = 'C23'
      Visible = False
    end
    object qryResultadoC24: TFloatField
      DisplayWidth = 10
      FieldName = 'C24'
      Visible = False
    end
    object qryResultadoC25: TStringField
      DisplayWidth = 50
      FieldName = 'C25'
      Visible = False
      Size = 50
    end
    object qryResultadoC26: TFloatField
      DisplayWidth = 10
      FieldName = 'C26'
      Visible = False
    end
    object qryResultadoC27: TStringField
      DisplayWidth = 50
      FieldName = 'C27'
      Visible = False
      Size = 50
    end
    object qryResultadoC28: TStringField
      DisplayWidth = 2
      FieldName = 'C28'
      Visible = False
      FixedChar = True
      Size = 2
    end
  end
  object dsResultado: TDataSource
    DataSet = qryResultado
    Left = 421
    Top = 161
  end
  object qrySituacaoParticipante: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    SIT.FLGINTERNO'
      'FROM'
      '    ELEGPATRO    ELP,'
      '    PARTPREVPLAN PPP,'
      '    SITPART      SIT'
      'WHERE    '
      '    ELP.MATRICULA = :PMATRICULA'
      'AND PPP.IDPESSOA  = ELP.IDPESSOA'
      'AND PPP.IDPESSJUR = ELP.IDPESSJUR'
      'AND SIT.IDSITPART = PPP.IDSITPART'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end>
    object qrySituacaoParticipanteFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.SITPART.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
  end
end
