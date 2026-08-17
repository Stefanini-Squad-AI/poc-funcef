inherited frmCadEventoImovel: TfrmCadEventoImovel
  Left = 179
  Top = 216
  Caption = 'Cadastro de Eventos de Imóvel'
  ClientHeight = 408
  ClientWidth = 755
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 375
    inherited Panel1: TPanel
      Width = 753
      Height = 56
      inline molImovel1: TmolImovel
        Left = 8
        Top = 8
        Width = 737
        inherited edtImovel: TEdit
          Width = 601
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 608
          OnClick = molImovel1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 632
          Enabled = False
        end
      end
    end
    inherited pgc: TPageControl
      Top = 57
      Width = 753
      Height = 317
      inherited tbs: TTabSheet
        Caption = 'Eventos do Imóvel'
        inherited pnlControles: TPanel [0]
          Width = 377
          Height = 276
          Align = alLeft
          object Label3: TLabel
            Left = 16
            Top = 10
            Width = 90
            Height = 13
            Caption = 'Data do Evento'
          end
          object Label4: TLabel
            Left = 16
            Top = 50
            Width = 61
            Height = 13
            Caption = 'Cabeçalho'
          end
          object Label5: TLabel
            Left = 16
            Top = 130
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object Bevel1: TBevel
            Left = 372
            Top = 16
            Width = 3
            Height = 249
            Shape = bsLeftLine
          end
          object Label1: TLabel
            Left = 16
            Top = 226
            Width = 44
            Height = 13
            Caption = 'Usuário'
          end
          object Label6: TLabel
            Left = 16
            Top = 90
            Width = 78
            Height = 13
            Caption = 'Valor Anterior'
          end
          object Label7: TLabel
            Left = 152
            Top = 90
            Width = 63
            Height = 13
            Caption = 'Valor Atual'
          end
          object Label8: TLabel
            Left = 288
            Top = 90
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Bevel2: TBevel
            Left = 16
            Top = 218
            Width = 345
            Height = 3
            Shape = bsTopLine
          end
          object DBedtDataHistorico: TCMDateTimePicker
            Left = 16
            Top = 24
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'EVIDATA'
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
            TabOrder = 0
          end
          object DBedtHistorico: TDBEdit
            Left = 16
            Top = 64
            Width = 345
            Height = 21
            DataField = 'EVICABECALHO'
            DataSource = ds
            TabOrder = 1
          end
          object DBmemDescricao: TDBMemo
            Left = 16
            Top = 144
            Width = 345
            Height = 65
            DataField = 'EVIDESCRICAO'
            DataSource = ds
            MaxLength = 1750
            TabOrder = 2
          end
          object DBedtUsuario: TDBEdit
            Left = 16
            Top = 240
            Width = 345
            Height = 21
            DataField = 'USUARIO_EXTENSO'
            DataSource = ds
            Enabled = False
            TabOrder = 3
          end
          object DBedtVlrAnterior: TDBEdit
            Left = 16
            Top = 104
            Width = 121
            Height = 21
            DataField = 'EVIVLRANTERIOR'
            DataSource = ds
            TabOrder = 4
          end
          object DBedtVlrAjustado: TDBEdit
            Left = 152
            Top = 104
            Width = 121
            Height = 21
            DataField = 'EVIVLRAJUSTADO'
            DataSource = ds
            TabOrder = 5
          end
          object DBedtPercent: TDBEdit
            Left = 288
            Top = 104
            Width = 73
            Height = 21
            DataField = 'EVIPERCENT'
            DataSource = ds
            TabOrder = 6
          end
        end
        inherited Dock973: TDock97 [1]
          Width = 745
        end
        inherited pnlGrd: TPanel
          Left = 377
          Top = 31
          Width = 368
          Height = 276
          inherited DBgrd: TwwDBGrid
            Left = 8
            Top = 37
            Width = 345
            Height = 224
            Selected.Strings = (
              'EVIDATA'#9'10'#9'Data'
              'EVICABECALHO'#9'60'#9'Cabeçalho'#9'F')
          end
          object Panel3: TPanel
            Left = 8
            Top = 16
            Width = 345
            Height = 22
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Eventos'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 755
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOIMOVEL'
      'set'
      '  IDEVENTOIMOVEL = :IDEVENTOIMOVEL,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  EVIDATA = :EVIDATA,'
      '  EVICABECALHO = :EVICABECALHO,'
      '  EVIDESCRICAO = :EVIDESCRICAO,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  FLGTIPOEVENTO = :FLGTIPOEVENTO,'
      '  EVIVLRANTERIOR = :EVIVLRANTERIOR,'
      '  EVIVLRAJUSTADO = :EVIVLRAJUSTADO,'
      '  EVIPERCENT = :EVIPERCENT'
      'where'
      '  IDEVENTOIMOVEL = :OLD_IDEVENTOIMOVEL and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into EVENTOIMOVEL'
      
        '  (IDEVENTOIMOVEL, IDIMOVEL, EVIDATA, EVICABECALHO, EVIDESCRICAO' +
        ', IDUSUARIO, '
      '   FLGTIPOEVENTO, EVIVLRANTERIOR, EVIVLRAJUSTADO, EVIPERCENT)'
      'values'
      
        '  (:IDEVENTOIMOVEL, :IDIMOVEL, :EVIDATA, :EVICABECALHO, :EVIDESC' +
        'RICAO, '
      
        '   :IDUSUARIO, :FLGTIPOEVENTO, :EVIVLRANTERIOR, :EVIVLRAJUSTADO,' +
        ' :EVIPERCENT)')
    DeleteSQL.Strings = (
      'delete from EVENTOIMOVEL'
      'where'
      '  IDEVENTOIMOVEL = :OLD_IDEVENTOIMOVEL and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 624
    Top = 160
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   E.IDEVENTOIMOVEL, E.IDIMOVEL,'
      '   E.EVIDATA, E.EVICABECALHO, E.EVIDESCRICAO,'
      '   E.IDUSUARIO, E.FLGTIPOEVENTO,'
      ''
      '   E.EVIVLRANTERIOR, E.EVIVLRAJUSTADO, E.EVIPERCENT,'
      ''
      '   U.NOMEUSUARIO, PU.NOME,'
      '   (U.NOMEUSUARIO||'#39' - '#39'||PU.NOME) AS USUARIO_EXTENSO'
      ''
      'FROM'
      '   PESSOA PU, EVENTOIMOVEL E, USUARIOSISTEMA U'
      ''
      'WHERE'
      '   ( E.IDIMOVEL =:IMOVEL )'
      '   AND ( E.IDUSUARIO = U.IDUSUARIO(+) )'
      '   AND ( U.IDUSUARIO = PU.IDPESSOA(+) )'
      ''
      'ORDER BY'
      '   E.EVIDATA, E.EVICABECALHO')
    Left = 656
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryEVIDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'EVIDATA'
      Origin = 'EVENTOIMOVEL.EVIDATA'
    end
    object qryEVICABECALHO: TStringField
      DisplayLabel = 'Cabeçalho'
      DisplayWidth = 60
      FieldName = 'EVICABECALHO'
      Origin = 'EVENTOIMOVEL.EVICABECALHO'
      Size = 60
    end
    object qryEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      Origin = 'EVENTOIMOVEL.EVIDESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'EVENTOIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
      Origin = 'EVENTOIMOVEL.IDEVENTOIMOVEL'
      Visible = False
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object qryNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Visible = False
      FixedChar = True
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object qryUSUARIO_EXTENSO: TStringField
      FieldName = 'USUARIO_EXTENSO'
      Visible = False
      Size = 83
    end
    object qryEVIVLRANTERIOR: TFloatField
      FieldName = 'EVIVLRANTERIOR'
      Visible = False
    end
    object qryEVIVLRAJUSTADO: TFloatField
      FieldName = 'EVIVLRAJUSTADO'
      Visible = False
    end
    object qryEVIPERCENT: TFloatField
      FieldName = 'EVIPERCENT'
      Visible = False
    end
    object qryFLGTIPOEVENTO: TStringField
      FieldName = 'FLGTIPOEVENTO'
      Visible = False
      Size = 2
    end
  end
  inherited ds: TwwDataSource
    Left = 688
    Top = 160
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 664
    Top = 224
  end
end
