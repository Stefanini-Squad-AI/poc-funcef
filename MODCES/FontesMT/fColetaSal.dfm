inherited frmColetaSal: TfrmColetaSal
  Left = 90
  Top = 146
  Caption = 'Coleta de Dados para Pesquisa Salarial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
end
