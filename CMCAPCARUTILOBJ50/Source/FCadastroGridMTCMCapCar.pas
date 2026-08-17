unit FCadastroGridMTCMCapCar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCmTypes;

type
  TfrmCadastroGridMTCMCapCar = class(TFrmCadastroGridMT)
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdTopRowChanged(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);

  protected
    procedure FazerRefresh; virtual;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroGridMTCMCapCar: TfrmCadastroGridMTCMCapCar;

implementation

{$R *.DFM}

procedure TfrmCadastroGridMTCMCapCar.dbGrdCalcCellColors(Sender: TObject;
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

procedure TfrmCadastroGridMTCMCapCar.dbGrdTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadastroGridMTCMCapCar.FazerRefresh;
begin
  { o inherited deste método deve estar sempre no final da instrução }
  if (not Cds.IsEmpty) then
    if CmeCadastro.Operacao in [OpIdle, OpVazio] then begin
      CmeCadastro.Operacao := OpIdle;
      CmeCadastro.AtualizaBotoes (self);
    end;
end;

procedure TfrmCadastroGridMTCMCapCar.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  FazerRefresh;
end;

procedure TfrmCadastroGridMTCMCapCar.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  FazerRefresh;
end;

procedure TfrmCadastroGridMTCMCapCar.FormShow(Sender: TObject);
begin
  inherited;
  pnlControles.SendToBack;
end;

procedure TfrmCadastroGridMTCMCapCar.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // bug padrão
  if CmeCadastro.Operacao = OpInserir then
    CmeCadastro.Operacao := opIdle;
  FazerRefresh;
end;

procedure TfrmCadastroGridMTCMCapCar.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (Cds.State = dsbrowse) then Cds.Edit;  // bug padrão
end;

procedure TfrmCadastroGridMTCMCapCar.CmeCadastroInsert(Sender: TObject);
begin
  // bug do padrão
  Cds.Close;
  Cds.CreateDataSet;
  inherited;
end;

procedure TfrmCadastroGridMTCMCapCar.dbGrdDblClick(Sender: TObject);
begin
  inherited;
  if not Cds.IsEmpty then sbtnAlterarClick( Self );
end;

procedure TfrmCadastroGridMTCMCapCar.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  { aqui que vc programa a ordenação do grid - programar no filho
    ex:
    Cds.IndexFiedName := aFiedName; }
end;

end.
