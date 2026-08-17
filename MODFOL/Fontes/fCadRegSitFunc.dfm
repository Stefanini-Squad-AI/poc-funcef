inherited frmCadRegSitFunc: TfrmCadRegSitFunc
  Left = 42
  Top = 114
  Caption = 'Registro de Alteração da Situação Funcional'
  ClientHeight = 412
  ClientWidth = 721
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 326
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 713
      Height = 34
      object Label1: TLabel
        Left = 12
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label6: TLabel
        Left = 190
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbtxtSituacao: TDBText
        Left = 633
        Top = 6
        Width = 68
        Height = 21
        Alignment = taCenter
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedMat: TwwDBEdit
        Left = 71
        Top = 6
        Width = 98
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 226
        Top = 6
        Width = 391
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 38
      Width = 713
      Height = 284
      Tabs.Strings = (
        'Situação Funcional')
      inherited pgctrlDetalhe: TPageControl
        Width = 615
        Height = 225
        inherited tbsDet: TTabSheet
          Caption = 'Situação Funcional'
          inherited dbgrdDet: TwwDBGrid
            Width = 607
            Height = 197
            Selected.Strings = (
              'DATASITFUNC'#9'10'#9'Data da Alteração'#9'F'
              'SITUACAO'#9'40'#9'Situação Funcional'#9'F'
              'MOT_OFICIAL'#9'50'#9'Motivo Oficial'#9'F'
              'MOT_GERENCIAL'#9'40'#9'Motivo Gerencial'#9'F'
              'MOVCONTRCAGED'#9'40'#9'Mov. Contratual'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 607
            Height = 197
            object Label4: TLabel
              Left = 26
              Top = 8
              Width = 104
              Height = 13
              Caption = 'Data da Alteração'
            end
            object Label7: TLabel
              Left = 170
              Top = 8
              Width = 110
              Height = 13
              Caption = 'Situação Funcional'
            end
            object Label2: TLabel
              Left = 26
              Top = 64
              Width = 79
              Height = 13
              Caption = 'Motivo Oficial'
            end
            object Label3: TLabel
              Left = 26
              Top = 116
              Width = 97
              Height = 13
              Caption = 'Motivo Gerencial'
            end
            object Label5: TLabel
              Left = 26
              Top = 170
              Width = 170
              Height = 13
              Caption = 'Movimento Contratual CAGED'
            end
            object dbedDatAlt: TCMDateTimePicker
              Left = 26
              Top = 22
              Width = 112
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATASITFUNC'
              DataSource = dsDet
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
              TabOrder = 0
            end
            object dblcSitFunc: TwwDBLookupCombo
              Left = 170
              Top = 22
              Width = 406
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'DESCRICAO')
              DataField = 'IDSITFUNC'
              DataSource = dsDet
              LookupTable = qrySitFunc
              LookupField = 'IDSITFUNC'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcSitFuncCloseUp
            end
            object dblcMotivoOfic: TwwDBLookupCombo
              Left = 26
              Top = 78
              Width = 406
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVOOFIC'
              DataSource = dsDet
              LookupTable = qryMotivoOfi
              LookupField = 'IDMOTIVO'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcMotivoGer: TwwDBLookupCombo
              Left = 26
              Top = 130
              Width = 406
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVOGER'
              DataSource = dsDet
              LookupTable = qryMotivoGer
              LookupField = 'IDMOTIVO'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcMovContrCAGED: TwwDBLookupCombo
              Left = 26
              Top = 184
              Width = 406
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOVCONTRCAGED'
              DataSource = dsDet
              LookupTable = qryMovContr
              LookupField = 'IDMOVCONTRCAGED'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 705
      end
      inherited Dock974: TDock97
        Left = 619
        Height = 225
      end
    end
  end
  inherited Dock972: TDock97
    Width = 721
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 551
      DockPos = 551
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 383
      DockPos = 383
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  ('#39'  '#39' || P.NOME) AS NOME,  P.IDPESSOA, ST.TIPOSIT, F.MATRICULA' +
        ','
      
        '  DECODE(ST.TIPOSIT,'#39'A'#39','#39'(Ativ'#39', '#39'F'#39','#39'(Afastad'#39', '#39'D'#39','#39'(Demitid'#39')' +
        ' ||'
      '    DECODE(PEFIS.SEXO,'#39'F'#39','#39'a)'#39','#39'o)'#39') AS SITUACAO'
      'FROM'
      '  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'
      'WHERE'
      '  (P.IDPESSOA  = :IDPESSOA)    AND'
      '  (P.IDPESSOA  = F.IDPESSOA)   AND'
      '  (F.IDSITFUNC = ST.IDSITFUNC) AND'
      '  (F.IDPESSOA  = PEFIS.IDPESSOA)')
    Left = 292
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10329
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 506
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
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
      'update FUNCIONARIO'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into FUNCIONARIO'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from FUNCIONARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 263
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Registro de Alteração Funcional'
    Colunas.Strings = (
      'PESSOA.NOME'
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
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDCARGO   = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    Left = 381
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 321
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTSITFUNC'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDSITFUNC = :IDSITFUNC,'
      '  IDMOTIVOOFIC = :IDMOTIVOOFIC,'
      '  IDMOTIVOGER = :IDMOTIVOGER,'
      '  IDMOVCONTRCAGED = :IDMOVCONTRCAGED,'
      '  DATASITFUNC = :DATASITFUNC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATASITFUNC = :OLD_DATASITFUNC')
    InsertSQL.Strings = (
      'insert into HSTSITFUNC'
      
        '  (IDPESSOA, IDSITFUNC, IDMOTIVOOFIC, IDMOTIVOGER, IDMOVCONTRCAG' +
        'ED, DATASITFUNC)'
      'values'
      
        '  (:IDPESSOA, :IDSITFUNC, :IDMOTIVOOFIC, :IDMOTIVOGER, :IDMOVCON' +
        'TRCAGED, '
      '   :DATASITFUNC)')
    DeleteSQL.Strings = (
      'delete from HSTSITFUNC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATASITFUNC = :OLD_DATASITFUNC')
    Left = 444
    Top = 1
  end
  object qryMotivoOfi: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO IN ('#39'A'#39','#39'D'#39'))'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 646
    Top = 232
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HST.IDPESSOA, HST.IDSITFUNC, HST.IDMOTIVOOFIC,'
      '  HST.IDMOTIVOGER, HST.IDMOVCONTRCAGED,'
      '  HST.DATASITFUNC,'
      '  MO1.DESCRICAO AS MOT_OFICIAL,'
      '  MO2.DESCRICAO AS MOT_GERENCIAL,'
      '  ST.DESCRICAO  AS SITUACAO,'
      '  MV.DESCRICAO  AS MOVCONTRCAGED'
      'FROM'
      
        '  HSTSITFUNC HST, SITFUNC ST, MOTIVO MO1, MOTIVO MO2, MOVCONTRCA' +
        'GED MV'
      'WHERE'
      '  (HST.IDPESSOA        = :IDPESSOA)       AND'
      '  (HST.IDSITFUNC       = ST.IDSITFUNC)    AND'
      '  (HST.IDMOTIVOOFIC    = MO1.IDMOTIVO(+)) AND'
      '  (HST.IDMOTIVOGER     = MO2.IDMOTIVO(+)) AND'
      '  (HST.IDMOVCONTRCAGED = MV.IDMOVCONTRCAGED(+))'
      'ORDER BY'
      '  HST.DATASITFUNC DESC')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 475
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDSITFUNC, DESCRICAO'
      'FROM'
      '  SITFUNC'
      'WHERE'
      '  (FLGUSO IN ('#39'R'#39','#39'G'#39'))'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 646
    Top = 280
  end
  object qryMovContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOVCONTRCAGED, DESCRICAO'
      'FROM'
      '  MOVCONTRCAGED'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 647
    Top = 327
  end
  object qryMotivoGer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO IN ('#39'A'#39','#39'D'#39'))'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 646
    Top = 219
  end
end
