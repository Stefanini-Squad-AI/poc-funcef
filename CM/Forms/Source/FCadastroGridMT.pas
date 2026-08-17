unit FCadastroGridMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Provider, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, uCMTypes, Gauges, ComCtrls, fcLabel;

type
  TFrmCadastroGridMT = class(TFrmCadastroMT)
    pnlControles: TPanel;
    dbGrd: TwwDBGrid;
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);

  protected
    procedure FazerRefresh; virtual;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroGridMT: TFrmCadastroGridMT;

implementation

{$R *.DFM}



procedure TFrmCadastroGridMT.CmeCadastroAtualizaBotoes(Sender: TObject);
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



procedure TFrmCadastroGridMT.dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;



procedure TFrmCadastroGridMT.dbGrdTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TFrmCadastroGridMT.FormShow(Sender: TObject);
begin
   inherited;
   pnlControles.SendToBack;
end;



procedure TfrmCadastroGridMT.FazerRefresh;
begin
  { o inherited deste método deve estar sempre no final da instrução }
//  if (not Cds.IsEmpty) then
//    if CmeCadastro.Operacao in [OpIdle, OpVazio] then begin
//      CmeCadastro.Operacao := OpIdle;
//      CmeCadastro.AtualizaBotoes (self);
//    end;
end;



procedure TFrmCadastroGridMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
//  FazerRefresh;
end;



procedure TFrmCadastroGridMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
//  FazerRefresh;
end;



procedure TFrmCadastroGridMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
//  if CmeCadastro.Operacao = OpInserir then
//    CmeCadastro.Operacao := opIdle;
//  FazerRefresh;
end;



procedure TFrmCadastroGridMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
//  if (Cds.State = dsbrowse) then Cds.Edit;  // bug padrão
end;



procedure TFrmCadastroGridMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
//  Cds.Close;
//  Cds.CreateDataSet;
end;



procedure TFrmCadastroGridMT.dbGrdDblClick(Sender: TObject);
begin
  inherited;
//  if not Cds.IsEmpty then sbtnAlterarClick( Self );
end;



end.
