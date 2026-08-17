inherited frmRelFornServ: TfrmRelFornServ
  Top = 149
  Caption = 'Relatório de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  object qryforn: TwwQuery
    BeforeOpen = qryfornBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  PESSOA.IDPESSOA , PESSOA.NOME , PESSOA.RAZAOSOCIAL '
      'from fornserv , pessoa'
      'where fornserv.idpessoa = pessoa.idpessoa')
    ValidateWithMask = True
    Left = 150
    Top = 1
  end
  object dsforn: TwwDataSource
    DataSet = qryforn
    Left = 190
    Top = 9
  end
end
 bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
        Kind = bkCustom
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
        Kind = bkCustom
      end
    end
  end
  object Panel2: TPanel 
