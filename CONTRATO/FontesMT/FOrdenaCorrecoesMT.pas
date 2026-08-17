unit FOrdenaCorrecoesMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, DBClient, uCMClientDataSet, uCtrlCorrecoesContratuais,
  uCmSqlParams;

type
  TfrmOrdenaCorrecoesMT = class(TfrmSairAjuda)
    dbgTiposSel: TwwDBGrid;
    pnlTituloP: TPanel;
    dsCorrecoes: TwwDataSource;
    bbtnDescer: TBitBtn;
    bbtnSubir: TBitBtn;
    cdsCorrecoes: TCMClientDataSet;
    procedure bbtnSubirClick(Sender: TObject);
    procedure bbtnDescerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlCorrecoes : TCtrlCorrecoesContratuais;
    procedure SodeDesceGrupo(rIDObjetoDest,rIdItemDest,rIDObjetoOrig,rIdItemOrig: Double);
  public
    { Public declarations }
  end;

var
  frmOrdenaCorrecoesMT: TfrmOrdenaCorrecoesMT;

implementation

{$R *.DFM}

uses uMensErro, DBaseDados,uSistema;

procedure TfrmOrdenaCorrecoesMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlCorrecoes
   CtrlCorrecoes:=TCtrlCorrecoesContratuais.Create;
   CtrlCorrecoes.Initialize(dtmBaseDados.dbBaseDados,True);
end;

procedure TfrmOrdenaCorrecoesMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   CtrlCorrecoes.Free;
end;

procedure TfrmOrdenaCorrecoesMT.bbtnSubirClick(Sender: TObject);
var
   rOrdemAtual   : Double;
   rOrdemNova    : Double;
   PosicaoAtual  : TBookMark;
   rIDObjetoOrig : Double;
   rIDItemOrig   : Double;
   rIDObjetoDest : Double;
   rIDItemDest   : Double;
begin
  inherited;

  rOrdemAtual:=cdsCorrecoes.FieldByName('ORDEM').AsFloat;
  rIDObjetoOrig:=cdsCorrecoes.FieldByName('IDOBJETO').AsFloat;
  rIDItemOrig:=cdsCorrecoes.FieldByName('IDITEM').AsFloat;

  PosicaoAtual:=cdsCorrecoes.GetBookmark;
  try
     cdsCorrecoes.Prior;
     if not(cdsCorrecoes.Bof) then
      begin
         rIDObjetoDest:=cdsCorrecoes.FieldByName('IDOBJETO').AsFloat;
         rIDItemDest:=cdsCorrecoes.FieldByName('IDITEM').AsFloat;

         if (rIDObjetoOrig=rIDObjetoDest) and (rIDItemOrig=rIDItemDest) then
          begin
             rOrdemNova:=cdsCorrecoes.FieldByName('ORDEM').AsFloat;

             cdsCorrecoes.Edit;
             cdsCorrecoes.FieldByName('ORDEM').AsFloat:=rOrdemAtual;
             cdsCorrecoes.Post;

             cdsCorrecoes.GotoBookmark(PosicaoAtual);

             cdsCorrecoes.Edit;
             cdsCorrecoes.FieldByName('ORDEM').AsFloat:=rOrdemNova;
             cdsCorrecoes.Post;
          end
         else
          SodeDesceGrupo(rIDObjetoDest,rIDItemDest,rIDObjetoOrig,rIDItemOrig);
      end;
  finally
     cdsCorrecoes.FreeBookmark(PosicaoAtual);
  end;
end;

procedure TfrmOrdenaCorrecoesMT.bbtnDescerClick(Sender: TObject);
var
   rOrdemAtual  : Double;
   rOrdemNova   : Double;
   PosicaoAtual : TBookMark;
   rIDObjetoOrig : Double;
   rIDItemOrig   : Double;
   rIDObjetoDest : Double;
   rIDItemDest   : Double;
begin
  inherited;

  rOrdemAtual:=cdsCorrecoes.FieldByName('ORDEM').AsFloat;
  rIDObjetoOrig:=cdsCorrecoes.FieldByName('IDOBJETO').AsFloat;
  rIDItemOrig:=cdsCorrecoes.FieldByName('IDITEM').AsFloat;

  PosicaoAtual:=cdsCorrecoes.GetBookmark;
  try
     cdsCorrecoes.Next;
     if not(cdsCorrecoes.Eof) then
      begin
         rIDObjetoDest:=cdsCorrecoes.FieldByName('IDOBJETO').AsFloat;
         rIDItemDest:=cdsCorrecoes.FieldByName('IDITEM').AsFloat;

         if (rIDObjetoOrig=rIDObjetoDest) and (rIDItemOrig=rIDItemDest) then
          begin
             rOrdemNova:=cdsCorrecoes.FieldByName('ORDEM').AsFloat;

             cdsCorrecoes.Edit;
             cdsCorrecoes.FieldByName('ORDEM').AsFloat:=rOrdemAtual;
             cdsCorrecoes.Post;

             cdsCorrecoes.GotoBookmark(PosicaoAtual);

             cdsCorrecoes.Edit;
             cdsCorrecoes.FieldByName('ORDEM').AsFloat:=rOrdemNova;
             cdsCorrecoes.Post;
          end
         else
          SodeDesceGrupo(rIDObjetoDest,rIDItemDest,rIDObjetoOrig,rIDItemOrig);
      end;
  finally
     cdsCorrecoes.FreeBookmark(PosicaoAtual);
  end;
end;

procedure TfrmOrdenaCorrecoesMT.SodeDesceGrupo(rIDObjetoDest,rIdItemDest,
rIDObjetoOrig,rIdItemOrig: Double);
var
   cdsGrupoOrig : TCMClientDataSet;
   cdsGrupoDest : TCMClientDataSet;
   rNumOrdem    : Double;
   sOperacao    : String;
   iRepeticoes  : Integer;
begin
   cdsGrupoOrig:=TCMClientDataSet.Create(nil);
   cdsGrupoDest:=TCMClientDataSet.Create(nil);
   try
      cdsGrupoOrig.Data:=cdsCorrecoes.Data;
      cdsGrupoOrig.Filter:='(IDOBJETO = '+FloatToStr(rIDObjetoOrig)+') AND '+
                           '(IDITEM = '+FloatToStr(rIdItemOrig)+') ';
      cdsGrupoOrig.Filtered:=True;

      rNumOrdem:=cdsGrupoOrig.FieldByName('ORDEM').AsFloat;


      cdsGrupoDest.Data:=cdsCorrecoes.Data;
      cdsGrupoDest.Filter:='(IDOBJETO = '+FloatToStr(rIDObjetoDest)+') AND '+
                           '(IDITEM = '+FloatToStr(rIdItemDest)+') ';
      cdsGrupoDest.Filtered:=True;

      if (cdsGrupoDest.FieldByName('ORDEM').AsFloat<rNumOrdem) then
          rNumOrdem:=cdsGrupoDest.FieldByName('ORDEM').AsFloat;

      sOperacao:='O';
      if (cdsGrupoDest.FieldByName('ORDEM').AsFloat>
          cdsGrupoOrig.FieldByName('ORDEM').AsFloat) then sOperacao:='D';

      //Renumera blocos
      for iRepeticoes:=1 to 2 do
      begin
         if (sOperacao='D') then
          begin
             cdsGrupoDest.First;
             while not(cdsGrupoDest.IsEmpty) do
             begin
                cdsCorrecoes.Locate('IDOBJETO;IDITEM;ORDEM',
                                    VarArrayOf([cdsGrupoDest.FieldByName('IDOBJETO').AsFloat,
                                                cdsGrupoDest.FieldByName('IDITEM').AsFloat,
                                                cdsGrupoDest.FieldByName('ORDEM').AsFloat]),
                                    [loCaseInsensitive]);
                cdsCorrecoes.Edit;
                cdsCorrecoes.FieldByName('ORDEM').AsFloat:=rNumOrdem;
                cdsCorrecoes.Post;

                cdsGrupoDest.Delete;
                rNumOrdem:=rNumOrdem+1;
             end;
          end;

         if (sOperacao='O') then
          begin
             cdsGrupoOrig.First;
             while not(cdsGrupoOrig.IsEmpty) do
             begin
                cdsCorrecoes.Locate('IDOBJETO;IDITEM;ORDEM',
                                    VarArrayOf([cdsGrupoOrig.FieldByName('IDOBJETO').AsFloat,
                                                cdsGrupoOrig.FieldByName('IDITEM').AsFloat,
                                                cdsGrupoOrig.FieldByName('ORDEM').AsFloat]),
                                    [loCaseInsensitive]);
                cdsCorrecoes.Edit;
                cdsCorrecoes.FieldByName('ORDEM').AsFloat:=rNumOrdem;
                cdsCorrecoes.Post;

                cdsGrupoOrig.Delete;
                rNumOrdem:=rNumOrdem+1;
             end;
          end;

         if (sOperacao='O') then
             sOperacao:='D'
         else
             sOperacao:='O';
      end;
   finally
      cdsGrupoOrig.Free;
      cdsGrupoDest.Free;
   end;
end;

end.
