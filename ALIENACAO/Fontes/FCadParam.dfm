inherited frmCadParam: TfrmCadParam
  Left = 136
  Top = 84
  Caption = 'Parâmetros do Módulo de Alienação'
  ClientHeight = 417
  ClientWidth = 639
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 337
    Top = 214
    Width = 188
    Height = 13
    Caption = 'Pagamento de Amortização Extra'
  end
  inherited pnlFundo: TPanel
    Width = 639
    Height = 331
    object pcParam: TPageControl
      Left = 5
      Top = 5
      Width = 629
      Height = 321
      ActivePage = tsGeral
      Align = alClient
      TabOrder = 0
      object tsGeral: TTabSheet
        Caption = 'Geral'
        ImageIndex = 2
        object PnGeral: TPanel
          Left = 0
          Top = 0
          Width = 621
          Height = 293
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object dbcbNumProp: TDBCheckBox
            Left = 24
            Top = 80
            Width = 329
            Height = 17
            Caption = 'Gera Numeração Automática de Propostas'
            DataField = 'FLGNUMPROPOSTA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbIntegraCAF: TDBCheckBox
            Left = 24
            Top = 40
            Width = 329
            Height = 17
            Caption = 'Integra com Ativo Fixo'
            DataField = 'FLGINTEGRAATIVO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object tsOper: TTabSheet
        Caption = 'Receitas / Operações'
        object pnlOper: TPanel
          Left = 0
          Top = 0
          Width = 621
          Height = 293
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label9: TLabel
            Left = 16
            Top = 24
            Width = 107
            Height = 13
            Caption = 'Pagamento a Vista'
          end
          object Label11: TLabel
            Left = 328
            Top = 72
            Width = 188
            Height = 13
            Caption = 'Pagamento de Amortização Extra'
          end
          object Label12: TLabel
            Left = 328
            Top = 24
            Width = 114
            Height = 13
            Caption = 'Pagamento de Sinal'
          end
          object Label5: TLabel
            Left = 16
            Top = 72
            Width = 122
            Height = 13
            Caption = 'Projeção de Parcelas'
          end
          object Label10: TLabel
            Left = 328
            Top = 139
            Width = 195
            Height = 13
            Caption = 'Operação de Perdas na Alienação'
          end
          object dblcTipoAVista: TwwDBLookupCombo
            Left = 16
            Top = 40
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
            DataField = 'IDRECAVISTA'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookTipoRecDes
            LookupField = 'IDTIPOCUSTORECIMO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblcTipoAmortiz: TwwDBLookupCombo
            Left = 328
            Top = 88
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
            DataField = 'IDRECAMORTEXTRA'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookTipoRecDes
            LookupField = 'IDTIPOCUSTORECIMO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblcTipoSinal: TwwDBLookupCombo
            Left = 328
            Top = 40
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
            DataField = 'IDRECSINAL'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookTipoRecDes
            LookupField = 'IDTIPOCUSTORECIMO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblcProjecao: TwwDBLookupCombo
            Left = 16
            Top = 88
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
            DataField = 'IDRECPROJECAO'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookTipoRecDes
            LookupField = 'IDTIPOCUSTORECIMO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 120
            Width = 297
            Height = 161
            Caption = 'Parcelamento'
            TabOrder = 4
            object Label6: TLabel
              Left = 24
              Top = 20
              Width = 188
              Height = 13
              Caption = 'Prestação ( amortização + juros )'
            end
            object Label7: TLabel
              Left = 24
              Top = 112
              Width = 146
              Height = 13
              Caption = 'Provisionamento de Juros'
            end
            object Label8: TLabel
              Left = 24
              Top = 66
              Width = 52
              Height = 13
              Caption = 'Correção'
            end
            object dblcTipoParcela: TwwDBLookupCombo
              Left = 24
              Top = 36
              Width = 257
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
              DataField = 'IDRECAMORTIZACAO'
              DataSource = ds
              LookupTable = dtmLookImobiliario.qryLookTipoRecDes
              LookupField = 'IDTIPOCUSTORECIMO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 24
              Top = 128
              Width = 257
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
              DataField = 'IDRECJUROS'
              DataSource = ds
              LookupTable = dtmLookImobiliario.qryLookTipoRecDes
              LookupField = 'IDTIPOCUSTORECIMO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 24
              Top = 82
              Width = 257
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
              DataField = 'IDRECCORRECAO'
              DataSource = ds
              LookupTable = dtmLookImobiliario.qryLookTipoRecDes
              LookupField = 'IDTIPOCUSTORECIMO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          object dblcTipoPerdas: TwwDBLookupCombo
            Left = 328
            Top = 155
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
            DataField = 'IDRECPERDAS'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookTipoRecDes
            LookupField = 'IDTIPOCUSTORECIMO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 639
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
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
        Images = nil
        NumGlyphs = 3
      end
      inherited sbtnAlterar: TToolbarButton97
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
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 639
    inherited tb97Fundo: TToolbar97
      Left = 469
      DockPos = 656
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 302
      DockPos = 489
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnCancelar: TBitBtn
        Left = 80
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDPESSOA,'
      '     IDRECAMORTIZACAO,'
      '     IDRECJUROS,'
      '     IDRECCORRECAO,'
      '     IDRECSINAL,'
      '     IDRECAVISTA,'
      '     IDRECPROJECAO,'
      '     IDRECAMORTEXTRA,'
      '     IDRECPERDAS,'
      '     FLGNUMPROPOSTA,'
      '     FLGINTEGRAATIVO'
      'FROM'
      '     PARAMIMOVEL'
      'WHERE'
      '    ( IDPESSOA = :IDPESSOA)'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 274
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDPESSOA'
    end
    object qryIDRECAMORTIZACAO: TFloatField
      FieldName = 'IDRECAMORTIZACAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECAMORTIZACAO'
    end
    object qryIDRECJUROS: TFloatField
      FieldName = 'IDRECJUROS'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECJUROS'
    end
    object qryIDRECCORRECAO: TFloatField
      FieldName = 'IDRECCORRECAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECCORRECAO'
    end
    object qryIDRECSINAL: TFloatField
      FieldName = 'IDRECSINAL'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECSINAL'
    end
    object qryIDRECAVISTA: TFloatField
      FieldName = 'IDRECAVISTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECAVISTA'
    end
    object qryIDRECPROJECAO: TFloatField
      FieldName = 'IDRECPROJECAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECPROJECAO'
    end
    object qryIDRECAMORTEXTRA: TFloatField
      FieldName = 'IDRECAMORTEXTRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECAMORTEXTRA'
    end
    object qryFLGNUMPROPOSTA: TFloatField
      FieldName = 'FLGNUMPROPOSTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGNUMPROPOSTA'
    end
    object qryFLGINTEGRAATIVO: TFloatField
      FieldName = 'FLGINTEGRAATIVO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRAATIVO'
    end
    object qryIDRECPERDAS: TFloatField
      FieldName = 'IDRECPERDAS'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 776
    Top = 65534
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMIMOVEL'
      'set'
      '  IDRECAMORTIZACAO = :IDRECAMORTIZACAO,'
      '  IDRECJUROS = :IDRECJUROS,'
      '  IDRECCORRECAO = :IDRECCORRECAO,'
      '  IDRECSINAL = :IDRECSINAL,'
      '  IDRECAVISTA = :IDRECAVISTA,'
      '  IDRECPROJECAO = :IDRECPROJECAO,'
      '  IDRECAMORTEXTRA = :IDRECAMORTEXTRA,'
      '  IDRECPERDAS = :IDRECPERDAS,'
      '  FLGNUMPROPOSTA = :FLGNUMPROPOSTA,'
      '  FLGINTEGRAATIVO = :FLGINTEGRAATIVO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMIMOVEL'
      
        '  (IDPESSOA, IDRECAMORTIZACAO, IDRECJUROS, IDRECCORRECAO, IDRECS' +
        'INAL, IDRECAVISTA, '
      
        '   IDRECPROJECAO, IDRECAMORTEXTRA, IDRECPERDAS, FLGNUMPROPOSTA, ' +
        'FLGINTEGRAATIVO)'
      'values'
      
        '  (:IDPESSOA, :IDRECAMORTIZACAO, :IDRECJUROS, :IDRECCORRECAO, :I' +
        'DRECSINAL, '
      
        '   :IDRECAVISTA, :IDRECPROJECAO, :IDRECAMORTEXTRA, :IDRECPERDAS,' +
        ' :FLGNUMPROPOSTA, '
      '   :FLGINTEGRAATIVO)')
    DeleteSQL.Strings = (
      'delete from PARAMIMOVEL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 307
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 477
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 347
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 537
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    Left = 412
    Top = 6
  end
end
