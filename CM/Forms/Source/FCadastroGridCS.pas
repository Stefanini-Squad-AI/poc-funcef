unit FCadastroGridCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, wwQuery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, IvDictio, IvMulti, IvEMulti, ImgList, ActnList,
  CmEventosCadastro{$IFNDEF VER0505}, uCMTypes, Gauges, ComCtrls, fcLabel {$ENDIF};

type
  TFrmCadastroGridCS = class(TfrmCadastroCS)
    dbGrd: TwwDBGrid;
    pnlControles: TPanel;
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
  protected

  public               
    { Public declarations }
  end;

var
  FrmCadastroGridCS: TFrmCadastroGridCS;

implementation

{$R *.DFM}



procedure TFrmCadastroGridCS.CmeCadastroAtualizaBotoes(
  Sender: TObject);
var
   List : TList;
begin
   inherited;
   List := TList.Create;
   case CmeCadastro.Operacao of
        opVazio, opIdle, opProcurar, opApagar : begin
                                            dbGrd.Visible := true;
                                            //dbgrd.SetFocus;
                                       end;
        opInserir, opAlterar : begin
                                    dbGrd.Visible := false;
                                    (pnlControles).GetTabOrderList(List);
                                    try
                                       TWinControl(List[0]).SetFocus ;
                                    except end;
                               end;
   end;
   List.free;
   pnlFundo.Enabled := true;
end;

end.
