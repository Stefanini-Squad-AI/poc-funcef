inherited frmCadFerias: TfrmCadFerias
  Left = 40
  Top = 125
  Caption = 'Registro e Histórico de Férias'
  ClientHeight = 399
  ClientWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 700
    Height = 313
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 692
      Height = 34
      object Label1: TLabel
        Left = 7
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 162
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbtxtSituacao: TDBText
        Left = 601
        Top = 8
        Width = 83
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
        Left = 67
        Top = 8
        Width = 81
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
        Left = 200
        Top = 8
        Width = 390
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
      Width = 692
      Height = 271
      Tabs.Strings = (
        'Férias')
      inherited pgctrlDetalhe: TPageControl
        Width = 594
        Height = 212
        inherited tbsDet: TTabSheet
          Caption = 'Avaliações, Entrevistas, Testes ou Atributos Pessoais'
          inherited dbgrdDet: TwwDBGrid
            Width = 586
            Height = 184
            Selected.Strings = (
              'INIPERIODOFERIAS'#9'10'#9'Período Aquisitivo de'
              'FimPeriodoFerias'#9'10'#9'a'
              'INIGOZOFERIAS'#9'10'#9'Período de Gozo de'
              'FIMGOZOFERIAS'#9'10'#9'a'
              'FLGOCORRIDA'#9'10'#9'Já Processada?'
              'FLGABONO'#9'10'#9'Abono Pecuniário?'
              'QTDIASGOZO'#9'10'#9'Dias Gozo'
              'QTDIASABONO'#9'10'#9'Dias Abono'
              'QTDPARCDEVOL'#9'10'#9'Parcelas a Descontar')
            Font.Height = -11
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 586
            Height = 184
            object Label4: TLabel
              Left = 42
              Top = 60
              Width = 214
              Height = 13
              Caption = 'Início do Período de Gozo das Férias'
            end
            object Label5: TLabel
              Left = 42
              Top = 105
              Width = 208
              Height = 13
              Caption = 'Final do Período de Gozo das Férias'
            end
            object Label3: TLabel
              Left = 42
              Top = 7
              Width = 222
              Height = 13
              Caption = 'Início do Período Aquisitivo das Férias'
            end
            object Label6: TLabel
              Left = 42
              Top = 155
              Width = 177
              Height = 13
              Caption = 'Parcelas Dev. Adto. das Férias'
            end
            object dbedIniGozo: TCMDateTimePicker
              Left = 42
              Top = 75
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'INIGOZOFERIAS'
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
              TabOrder = 1
            end
            object dbedFimGozo: TCMDateTimePicker
              Left = 42
              Top = 120
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'FIMGOZOFERIAS'
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
              TabOrder = 2
              OnExit = dbedFimGozoExit
            end
            object dbedIniPeriodo: TCMDateTimePicker
              Left = 42
              Top = 22
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'INIPERIODOFERIAS'
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
            object dbrgProc: TDBRadioGroup
              Left = 355
              Top = 7
              Width = 163
              Height = 42
              Caption = 'Férias Já Processadas ?'
              Columns = 2
              DataField = 'FLGOCORRIDA'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 5
              Values.Strings = (
                '1'
                '0')
              OnClick = dbrgProcClick
            end
            object dbrgAbono: TDBRadioGroup
              Left = 355
              Top = 59
              Width = 163
              Height = 42
              Caption = 'Com Abono Pecuniário?'
              Columns = 2
              DataField = 'FLGABONO'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 6
              Values.Strings = (
                '1'
                '0')
              OnChange = dbrgAbonoChange
            end
            object rgFaltas: TRadioGroup
              Left = 355
              Top = 112
              Width = 163
              Height = 81
              Caption = 'Verifica Dias de Falta ?'
              ItemIndex = 2
              Items.Strings = (
                'Período Aquisitivo'
                'Ultimos 12 Meses'
                'Não')
              TabOrder = 7
            end
            object dbspeParcFer: TwwDBSpinEdit
              Left = 42
              Top = 168
              Width = 121
              Height = 21
              Increment = 1
              DataField = 'QTDPARCDEVOL'
              DataSource = dsDet
              TabOrder = 4
              UnboundDataType = wwDefault
            end
            object spedDias: TSpinEdit
              Left = 184
              Top = 120
              Width = 49
              Height = 22
              Hint = 'Final do Período de Gozo das Férias expresso em dias'
              MaxLength = 100
              MaxValue = 0
              MinValue = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Value = 0
              OnExit = spedDiasExit
            end
            object dbspedDiasAbono: TwwDBSpinEdit
              Left = 528
              Top = 71
              Width = 49
              Height = 21
              Increment = 1
              DataField = 'QTDIASABONO'
              DataSource = dsDet
              TabOrder = 8
              UnboundDataType = wwDefault
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 684
      end
      inherited Dock974: TDock97
        Left = 598
        Height = 212
      end
    end
  end
  inherited Dock972: TDock97
    Width = 700
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
    Top = 360
    Width = 700
    inherited tb97Fundo: TToolbar97
      Left = 531
      DockPos = 539
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 364
      DockPos = 365
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  F.IDPESSOA, F.MATRICULA, ('#39'  '#39' || UPPER(PF.NOME)) AS NOME,'
      '  F.DATAADMISSAO, ST.TIPOSIT,'
      
        '  DECODE(ST.TIPOSIT,'#39'A'#39','#39'(Ativ'#39', '#39'F'#39','#39'(Afastad'#39', '#39'D'#39','#39'(Demitid'#39')' +
        ' ||'
      '    DECODE(PEFIS.SEXO,'#39'F'#39','#39'a)'#39','#39'o)'#39') AS SITUACAO'
      'FROM'
      '  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'
      'WHERE'
      '  (F.IDPESSOA  = :IDPESSOA)      AND'
      '  (F.IDPESSOA  = PEFIS.IDPESSOA) AND'
      '  (F.IDPESSOA  = PF.IDPESSOA)    AND'
      '  (F.IDSITFUNC = ST.IDSITFUNC(+))')
    Left = 277
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 543
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
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 247
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UPPER(PESSOA.NOME)'
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
      'FUNCIONARIO.IDCARGO      = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA    = PESSOA.IDPESSOA')
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
    Left = 349
    Top = 1
  end
  object qryDet: TwwQuery [8]
    CachedUpdates = True
    BeforeInsert = qryDetBeforeInsert
    AfterInsert = qryDetAfterInsert
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  F.IDPESSOA, F.INIPERIODOFERIAS, F.NUMSEQ, F.INIGOZOFERIAS,'
      '  F.FIMGOZOFERIAS, F.FLGOCORRIDA, F.FLGABONO, F.QTDPARCDEVOL,'
      
        '  F.QTDIASABONO, (F.FIMGOZOFERIAS - F.INIGOZOFERIAS +1) AS QTDIA' +
        'SGOZO'
      'FROM'
      '  FERIAS F'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '  F.INIGOZOFERIAS, F.FIMGOZOFERIAS DESC')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGOCORRIDA;CheckBox;1;0'
      'FLGABONO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 497
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetINIPERIODOFERIAS: TDateTimeField
      DisplayLabel = 'Período Aquisitivo de'
      DisplayWidth = 10
      FieldName = 'INIPERIODOFERIAS'
      Origin = 'FERIAS.INIPERIODOFERIAS'
    end
    object qryDetFimPeriodoFerias: TDateField
      DisplayLabel = 'a'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'FimPeriodoFerias'
      Calculated = True
    end
    object qryDetINIGOZOFERIAS: TDateTimeField
      DisplayLabel = 'Período de Gozo de'
      DisplayWidth = 10
      FieldName = 'INIGOZOFERIAS'
      Origin = 'FERIAS.INIGOZOFERIAS'
    end
    object qryDetFIMGOZOFERIAS: TDateTimeField
      DisplayLabel = 'a'
      DisplayWidth = 10
      FieldName = 'FIMGOZOFERIAS'
      Origin = 'FERIAS.FIMGOZOFERIAS'
    end
    object qryDetFLGOCORRIDA: TFloatField
      DisplayLabel = 'Já Processada?'
      DisplayWidth = 10
      FieldName = 'FLGOCORRIDA'
      Origin = 'FERIAS.FLGOCORRIDA'
    end
    object qryDetFLGABONO: TFloatField
      DisplayLabel = 'Abono Pecuniário?'
      DisplayWidth = 10
      FieldName = 'FLGABONO'
      Origin = 'FERIAS.FLGABONO'
    end
    object qryDetQTDIASGOZO: TFloatField
      DisplayLabel = 'Dias Gozo'
      DisplayWidth = 10
      FieldName = 'QTDIASGOZO'
      Origin = 'BASEDADOS.FERIAS.FIMGOZOFERIAS'
    end
    object qryDetQTDIASABONO: TFloatField
      DisplayLabel = 'Dias Abono'
      DisplayWidth = 10
      FieldName = 'QTDIASABONO'
      Origin = 'BASEDADOS.FERIAS.QTDIASABONO'
    end
    object qryDetQTDPARCDEVOL: TFloatField
      DisplayLabel = 'Parcelas a Descontar'
      DisplayWidth = 10
      FieldName = 'QTDPARCDEVOL'
      Origin = 'FERIAS.QTDPARCDEVOL'
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'FERIAS.IDPESSOA'
      Visible = False
    end
    object qryDetNUMSEQ: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMSEQ'
      Origin = 'FERIAS.NUMSEQ'
      Visible = False
    end
  end
  inherited ds: TwwDataSource
    Left = 307
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
      'update FERIAS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  INIPERIODOFERIAS = :INIPERIODOFERIAS,'
      '  NUMSEQ = :NUMSEQ,'
      '  INIGOZOFERIAS = :INIGOZOFERIAS,'
      '  FIMGOZOFERIAS = :FIMGOZOFERIAS,'
      '  FLGOCORRIDA = :FLGOCORRIDA,'
      '  FLGABONO = :FLGABONO,'
      '  QTDPARCDEVOL = :QTDPARCDEVOL,'
      '  QTDIASABONO = :QTDIASABONO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  INIPERIODOFERIAS = :OLD_INIPERIODOFERIAS and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into FERIAS'
      
        '  (IDPESSOA, INIPERIODOFERIAS, NUMSEQ, INIGOZOFERIAS, FIMGOZOFER' +
        'IAS, FLGOCORRIDA, '
      '   FLGABONO, QTDPARCDEVOL, QTDIASABONO)'
      'values'
      
        '  (:IDPESSOA, :INIPERIODOFERIAS, :NUMSEQ, :INIGOZOFERIAS, :FIMGO' +
        'ZOFERIAS, '
      '   :FLGOCORRIDA, :FLGABONO, :QTDPARCDEVOL, :QTDIASABONO)')
    DeleteSQL.Strings = (
      'delete from FERIAS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  INIPERIODOFERIAS = :OLD_INIPERIODOFERIAS and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 446
    Top = 1
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FERIASINI, FERIASFIM FROM PARAMRH')
    ValidateWithMask = True
    Left = 632
    Top = 265
  end
  object qryRubFalta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (CODRUBCLT = '#39'00001'#39')')
    ValidateWithMask = True
    Left = 632
    Top = 252
  end
  object qryDiasFalta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 632
    Top = 239
  end
end
