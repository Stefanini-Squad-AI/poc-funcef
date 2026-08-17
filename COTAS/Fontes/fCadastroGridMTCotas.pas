unit fCadastroGridMTCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCMTypes;

type
  TFrmCadastroGridMTCotas = class(TFrmCadastroGridMT)
    procedure dbGrdDblClick(Sender: TObject);
    procedure dbGrdTopRowChanged(Sender: TObject);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);


    protected
       procedure FazerRefresh; virtual;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroGridMTCotas: TFrmCadastroGridMTCotas;

implementation

{$R *.DFM}





procedure TFrmCadastroGridMTCotas.dbGrdDblClick(Sender: TObject);
begin
   inherited;
   if sbtnAlterar.Enabled then
   begin
      if not Cds.IsEmpty then
         sbtnAlterarClick( Self );
   end;
end;



procedure TFrmCadastroGridMTCotas.dbGrdTopRowChanged(Sender: TObject);
begin
  inherited;
    // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TFrmCadastroGridMTCotas.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
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



procedure TFrmCadastroGridMTCotas.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Close;
  Cds.CreateDataSet;
  inherited;
end;



procedure TFrmCadastroGridMTCotas.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (Cds.State = dsbrowse) then Cds.Edit;
end;



procedure TFrmCadastroGridMTCotas.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao = OpInserir then
    CmeCadastro.Operacao := opIdle;
  FazerRefresh;
end;



procedure TFrmCadastroGridMTCotas.FormShow(Sender: TObject);
begin
  inherited;
  pnlControles.SendToBack;
end;



procedure TFrmCadastroGridMTCotas.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  FazerRefresh;
end;



procedure TFrmCadastroGridMTCotas.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  FazerRefresh;
end;



procedure TFrmCadastroGridMTCotas.FazerRefresh;
begin
  { o inherited deste método deve estar sempre no final da instrução }
  if (not Cds.IsEmpty) then
    if CmeCadastro.Operacao in [OpIdle, OpVazio] then begin
      CmeCadastro.Operacao := OpIdle;
      CmeCadastro.AtualizaBotoes (self);
    end;
end;

end.
