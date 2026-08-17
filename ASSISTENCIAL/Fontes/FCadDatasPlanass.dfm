inherited frmCadDatasPlanass: TfrmCadDatasPlanass
  Left = 46
  Top = 121
  Caption = 'Cadastro de Datas da Patrocinadora - Cobrança Bancária'
  ClientHeight = 420
  ClientWidth = 662
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 662
    Height = 381
    object pnlLeft: TPanel
      Left = 5
      Top = 9
      Width = 263
      Height = 367
      Align = alLeft
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText2: TStaticText
        Left = 0
        Top = 0
        Width = 263
        Height = 27
        Align = alTop
        Alignment = taCenter
        Caption = 'Planos Assistenciais'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object trvPlanos: TTreeView
        Left = 0
        Top = 27
        Width = 263
        Height = 340
        Align = alClient
        HideSelection = False
        Images = imGrupos
        Indent = 19
        ReadOnly = True
        TabOrder = 1
        OnChange = trvPlanosChange
        OnCollapsing = trvPlanosCollapsing
        OnExpanding = trvPlanosExpanding
        OnExpanded = trvPlanosExpanded
      end
    end
    object stxtPatro: TStaticText
      Left = 5
      Top = 5
      Width = 652
      Height = 4
      Align = alTop
      Alignment = taCenter
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object pnlRight: TPanel
      Left = 268
      Top = 9
      Width = 389
      Height = 367
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object pnlNormal: TPanel
        Left = 0
        Top = 88
        Width = 389
        Height = 94
        Align = alBottom
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 387
          Height = 30
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Dia de Recebimento da Cobrança Normal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 24
          Width = 82
          Height = 57
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 9
            Width = 20
            Height = 13
            Caption = 'Dia'
          end
          object spedNormal: TSpinEdit
            Left = 6
            Top = 21
            Width = 70
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 0
            Value = 1
          end
        end
        object rgrpUtilNormal: TRadioGroup
          Left = 189
          Top = 24
          Width = 85
          Height = 57
          Caption = 'Dia Útil ?'
          ItemIndex = 0
          Items.Strings = (
            'Não'
            'Sim')
          TabOrder = 1
        end
        object rgrpAntNormal: TRadioGroup
          Left = 279
          Top = 24
          Width = 103
          Height = 57
          Caption = 'Utilizar dia útil'
          ItemIndex = 0
          Items.Strings = (
            'Anterior'
            'Posterior')
          TabOrder = 2
        end
        object rgrpMesNormal: TRadioGroup
          Left = 93
          Top = 24
          Width = 91
          Height = 57
          Caption = 'Mês'
          ItemIndex = 1
          Items.Strings = (
            'Anterior'
            'Corrente'
            'Posterior')
          TabOrder = 3
        end
      end
      object stxtDatas: TStaticText
        Left = 0
        Top = 84
        Width = 389
        Height = 4
        Align = alBottom
        Alignment = taCenter
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object pnlAtraso: TPanel
        Left = 0
        Top = 182
        Width = 389
        Height = 91
        Align = alBottom
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label5: TLabel
          Left = 1
          Top = 1
          Width = 387
          Height = 30
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Dia de Recebimento da Cobrança em Atraso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 24
          Width = 82
          Height = 57
          TabOrder = 0
          object Label2: TLabel
            Left = 6
            Top = 9
            Width = 20
            Height = 13
            Caption = 'Dia'
          end
          object spedAtraso: TSpinEdit
            Left = 6
            Top = 21
            Width = 70
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 0
            Value = 1
          end
        end
        object rgrpUtilAtraso: TRadioGroup
          Left = 189
          Top = 24
          Width = 85
          Height = 57
          Caption = 'Dia Útil ?'
          ItemIndex = 0
          Items.Strings = (
            'Não'
            'Sim')
          TabOrder = 1
        end
        object rgrpAntAtraso: TRadioGroup
          Left = 279
          Top = 24
          Width = 103
          Height = 57
          Caption = 'Utilizar dia útil'
          ItemIndex = 0
          Items.Strings = (
            'Anterior'
            'Posterior')
          TabOrder = 2
        end
        object rgrpMesAtraso: TRadioGroup
          Left = 93
          Top = 24
          Width = 91
          Height = 57
          Caption = 'Mês'
          ItemIndex = 1
          Items.Strings = (
            'Anterior'
            'Corrente'
            'Posterior')
          TabOrder = 3
        end
      end
      object pnlDevol: TPanel
        Left = 0
        Top = 273
        Width = 389
        Height = 94
        Align = alBottom
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label6: TLabel
          Left = 1
          Top = 1
          Width = 387
          Height = 30
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Dia de Pagamento da Devolução'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox4: TGroupBox
          Left = 6
          Top = 24
          Width = 82
          Height = 57
          TabOrder = 0
          object Label3: TLabel
            Left = 6
            Top = 9
            Width = 20
            Height = 13
            Caption = 'Dia'
          end
          object spedDevolucao: TSpinEdit
            Left = 6
            Top = 21
            Width = 70
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 0
            Value = 1
          end
        end
        object rgrpUtilDevolucao: TRadioGroup
          Left = 189
          Top = 24
          Width = 85
          Height = 57
          Caption = 'Dia Útil ?'
          ItemIndex = 0
          Items.Strings = (
            'Não'
            'Sim')
          TabOrder = 1
        end
        object rgrpAntDevolucao: TRadioGroup
          Left = 279
          Top = 24
          Width = 103
          Height = 57
          Caption = 'Utilizar dia útil'
          ItemIndex = 0
          Items.Strings = (
            'Anterior'
            'Posterior')
          TabOrder = 2
        end
        object rgrpMesDevolucao: TRadioGroup
          Left = 93
          Top = 24
          Width = 91
          Height = 57
          Caption = 'Mês'
          ItemIndex = 1
          Items.Strings = (
            'Anterior'
            'Corrente'
            'Posterior')
          TabOrder = 3
        end
      end
      object bbtnProcurar: TBitBtn
        Left = 293
        Top = 1
        Width = 88
        Height = 32
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 662
    inherited tb97Fundo: TToolbar97
      Left = 492
      DockPos = 492
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 324
      DockPos = 324
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object lstAuxTipo: TListBox [2]
    Left = 142
    Top = 262
    Width = 121
    Height = 40
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object qryPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANASS,PL.NOME,'
      '       PESSOA.NOME PATRO,PLANPREV.NOME PREV'
      'FROM   PLANASS PL, PLANPREVASS PP, PLANPREV, PESSOA'
      'WHERE  (PP.IDPESSJUR =  :IDPESSJUR)'
      'AND    (PP.IDPLANOPREV =  :IDPLANOPREV)'
      'AND    (PP.IDPLANASS = PL.IDPLANASS)'
      'AND    (PP.IDPLANOPREV = PLANPREV.IDPLANOPREV)'
      'AND    (PESSOA.IDPESSOA = PP.IDPESSJUR)'
      'AND    (PLANPREV.TPPLANOPREV = '#39'F'#39')')
    ValidateWithMask = True
    Left = 39
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsPlanPatro: TwwDataSource
    DataSet = qryPlanPatro
    Left = 42
    Top = 131
  end
  object imGrupos: TImageList
    Left = 42
    Top = 240
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
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
      000000000000EF3DEF3D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      0000EF3DFF7FFF7F0000EF3DEF3D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F0000000000000000FF7F
      0000EF3DFF7F0F3CFF7FFF7F0000EF3DEF3D0000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      000000000F3C007C007C007CFF7FFF7F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F0000000000000000000000000000E07FF75EE07FF75E
      E07FF75EE07FF75EE07F00000000000000000000FF7F0000000000000000FF7F
      00000000007C007C007C007CFF7F0000EF3D0000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F000000000000000000000000FF7F0000E07FF75EE07F
      F75EE07FF75EE07FF75EE07F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      00000000007C007C0F3C0000EF3D000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F000000000000000000000000E07FFF7F0000E07FF75E
      E07FF75EE07FF75EE07FF75EE07F000000000000FF7F0000FF7F000000000000
      0000EF3DEF3D0000FF7FFF7F0000EF3D00000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F000000000000000000000000FF7FE07FFF7F00000000
      0000000000000000000000000000000000000000FF7FFF7FFF7F000000000000
      EF3D0000FF7FFF7FEF01FF7F0000EF3D00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F000000000000000000000000FF7FFF7FFF7F00000000EF3D
      FF7FFF7FEF011F001F001F00FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F00000000000000000000000000000000000000000000EF3D
      0000FF7F1F001F00EF011F00FF7F0000EF3D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FE07FFF7F
      E07F0000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000FF7F1F001F001F00EF01FF7FFF7F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000EF3D000000000000
      0000EF3D0000000000000000000000000000000000000000E07FFF7FE07FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      EF3D0000FF7FEF01FF7FFF7F0000EF3DEF3D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF3D0000000000000000
      EF3D000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7F0000EF3DEF3D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF3D0000EF3DEF3D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFF008F0000
      FFFFFFFF00030000E007FFFF00000000C007C00F00800000C007800700800000
      C007800300810000C007800100010000C007800104010000C007800F00010000
      C00F800F04000000E07F801FFE000000E07FC0FFB0000000FFFFC0FFB9030000
      FFFFFFFFC50F0000FFFFFFFFFFFF0000}
  end
  object qryDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPESSJUR,SITFUNDACAO,IDPLANOPREV,IDPLANASS,DIACOBNORMAL,' +
        'FLGUTILNORMAL,'
      
        '       FLGANTERIORNORMAL,DIACOBATRASO,FLGUTILATRASO,FLGANTERIORA' +
        'TRASO,'
      
        '       DIACOBDEVOLUCAO,FLGUTILDEVOLUCAO,FLGANTERIORDEVOL,FLGMESC' +
        'OBNORMAL,'
      '       FLGMESCOBATRASO,FLGMESCOBDEVOLUC'
      'FROM   DATASPATROPLANASS'
      'WHERE  (IDPESSJUR = :IDPESSJUR)'
      'AND    (IDPLANOPREV = :IDPLANOPREV)'
      'AND    (SITFUNDACAO = :IDSITPART)'
      'AND    (IDPLANASS =  :IDPLANASS)')
    ValidateWithMask = True
    Left = 224
    Top = 125
    ParamData = <
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
        DataType = ftString
        Name = 'IDSITPART'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 26
    Top = 194
  end
  object MontaSel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DISTINCT PESSOA.NOME'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Patrocinadora'
      'Plano Previdenciário')
    Tabelas.Strings = (
      'PESSOA'
      'PLANPREV'
      'PLANPREVASS')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PLANPREV.IDPLANOPREV')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = PLANPREVASS.IDPESSJUR'
      'PLANPREV.TPPLANOPREV = '#39'F'#39
      'PLANPREVASS.IDPLANOPREV = PLANPREV.IDPLANOPREV')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 488
    Top = 32
  end
  object qrypatro: TwwQuery
    ValidateWithMask = True
    Left = 221
    Top = 73
  end
end
