{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit fGetParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, wwrcdpnl, Wwdatsrc, DBClient, uCmSqlParams,
  DBCtrls, Mask, DBCGrids, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
  TFrmGetParams = class(TForm)
    PnlBotton: TPanel;
    Cds: TClientDataSet;
    Ds: TwwDataSource;
    CdsNOMEPARAM: TStringField;
    CdsTIPOPARAM: TStringField;
    CdsVALORPARAM: TStringField;
    CdsNULO: TStringField;
    BtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    wwDBGrid1: TwwDBGrid;
    CmbTipoDado: TwwDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

end.
