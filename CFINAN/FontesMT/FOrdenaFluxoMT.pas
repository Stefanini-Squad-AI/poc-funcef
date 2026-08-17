unit FOrdenaFluxoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, DBClient, uCMClientDataSet, uCtrlMontaFluxo;

type
  TfrmOrdenaFluxoMT = class(TfrmSairAjuda)
    dbgTiposSel: TwwDBGrid;
    pnlTituloP: TPanel;
    lblTituloP: TLabel;
    dsLinhasFluxo: TwwDataSource;
    bbtnDescer: TBitBtn;
    bbtnSubir: TBitBtn;
    cdsLinhasFluxo: TCMClientDataSet;

    procedure bbtnSubirClick(Sender: TObject);
    procedure bbtnDescerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);


  private { Private declarations }

    CtrlMontaFluxo : TCtrlMontaFluxo;
    iIdFluxoCaixa, iCodLinhaFluxo  : Double;


  public  { Public declarations }

    constructor Create(AOwner: TComponent; iIdFluxoCaixa: Double);  Reintroduce;


  end;



var
  frmOrdenaFluxoMT: TfrmOrdenaFluxoMT;



implementation
{$R *.DFM}
uses
  uMensErro, DBaseDados,uSistema;



constructor TfrmOrdenaFluxoMT.Create(AOwner: TComponent; iIdFluxoCaixa : Double);
begin
  Self.iIdFluxoCaixa := iIdFluxoCaixa;
  inherited Create(AOwner);
end;



procedure TfrmOrdenaFluxoMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlMontaFluxo

   CtrlMontaFluxo:=TCtrlMontaFluxo.Create( Sistema.IdEmpresa, Sistema.IdModulo, sistema.IdUsuario );
   CtrlMontaFluxo.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlMontaFluxo.CdsMontaFluxo:=cdsLinhasFluxo;

   //Carrega cdsLinhasFluxo
   cdsLinhasFluxo.Data:=CtrlMontaFluxo.ListMontaFluxo(iIdFluxoCaixa , -1, True );
end;



procedure TfrmOrdenaFluxoMT.bbtnSubirClick(Sender: TObject);
var
   rOrdemAtual  : Double;
   rOrdemNova   : Double;
   PosicaoAtual : TBookMark;
begin
  inherited;

  rOrdemAtual:=cdsLinhasFluxo.FieldByName('ORDEM').AsFloat;
  PosicaoAtual:=cdsLinhasFluxo.GetBookmark;
  try
     cdsLinhasFluxo.Prior;
     if not(cdsLinhasFluxo.Bof) then
      begin
         rOrdemNova:=cdsLinhasFluxo.FieldByName('ORDEM').AsFloat;

         cdsLinhasFluxo.Edit;
         cdsLinhasFluxo.FieldByName('ORDEM').AsFloat:=rOrdemAtual;
         cdsLinhasFluxo.Post;

         cdsLinhasFluxo.GotoBookmark(PosicaoAtual);

         cdsLinhasFluxo.Edit;
         cdsLinhasFluxo.FieldByName('ORDEM').AsFloat:=rOrdemNova;
         cdsLinhasFluxo.Post;
      end;
  finally
     cdsLinhasFluxo.FreeBookmark(PosicaoAtual);
  end;
end;

procedure TfrmOrdenaFluxoMT.bbtnDescerClick(Sender: TObject);
var
   rOrdemAtual  : Double;
   rOrdemNova   : Double;
   PosicaoAtual : TBookMark;
begin
  inherited;

  rOrdemAtual:=cdsLinhasFluxo.FieldByName('ORDEM').AsFloat;
  PosicaoAtual:=cdsLinhasFluxo.GetBookmark;
  try
     cdsLinhasFluxo.Next;
     if not(cdsLinhasFluxo.Eof) then
      begin
         rOrdemNova:=cdsLinhasFluxo.FieldByName('ORDEM').AsFloat;

         cdsLinhasFluxo.Edit;
         cdsLinhasFluxo.FieldByName('ORDEM').AsFloat:=rOrdemAtual;
         cdsLinhasFluxo.Post;

         cdsLinhasFluxo.GotoBookmark(PosicaoAtual);

         cdsLinhasFluxo.Edit;
         cdsLinhasFluxo.FieldByName('ORDEM').AsFloat:=rOrdemNova;
         cdsLinhasFluxo.Post;
      end;
  finally
     cdsLinhasFluxo.FreeBookmark(PosicaoAtual);
  end;
end;



procedure TfrmOrdenaFluxoMT.bbtnSairClick(Sender: TObject);
begin
   if not(CtrlMontaFluxo.GravaOrdenacao(cdsLinhasFluxo.Data)) then
      MsgDlg(CtrlMontaFluxo.MessageInfo,'Erro',mtError,[mbOK],0)
   else
      inherited;
end;



end.
