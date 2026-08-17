unit fParamCadBemCustom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
    Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc;

type
  TfrmParamCadBensCustom = class(TfrmOkCancelar)
    grpMovim: TGroupBox;
    dteDataMov: TCMDateTimePicker;
    Label4: TLabel;
    qryDet: TwwQuery;
    dsDet: TwwDataSource;
    updDet: TUpdateSQL;
    dbgrdDet: TwwDBGrid;
    qryDetIDPESSOA: TFloatField;
    qryDetIDBEM: TFloatField;
    qryDetPLACA: TFloatField;
    qryDetDESBEM: TStringField;
    bbtnSelBens: TBitBtn;
    eSubTitulo: TEdit;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelBensClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMascaraGrupo, sMascaraPlaca, sMascaraEmpresa : String;

  end;

var
  frmParamCadBensCustom: TfrmParamCadBensCustom;

implementation

{$R *.DFM}

uses uSistema, dRelOperCaf, uMensErro, fSelBem;

procedure TfrmParamCadBensCustom.FormCreate(Sender: TObject);
begin
   inherited;
   if qryDet.Active then qryDet.Close;
   if not qryDet.Prepared then qryDet.Prepare;
   //-------------------------------------------------------------------------------------
   qryDet.Open;
   dteDataMov.Date := date;
   eSubTitulo.Text := '';
end;
//========================================================================================
procedure TfrmParamCadBensCustom.bbtnConfirmarClick(Sender: TObject);
var
   iNBens : Integer;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      Label11.Caption := 'Relatório Customizado de Bens em ' + dteDataMov.Text;
      //----------------------------------------------------------------------------------
      qrySelBensCustom.Close;
      qrySelBensCustom.SQL.Clear;
      qrySelBensCustom.SQL.Add(' SELECT B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, B.DATAULTDEP, B.DATAINICIODEP, B.IDNOTA, B.COMPLNOTA,');
      qrySelBensCustom.SQL.Add('        B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS DESCCCUSTO,   ');
      qrySelBensCustom.SQL.Add('        L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCGRUPO,          ');
      qrySelBensCustom.SQL.Add('        C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS VALHISTORICO,   ');
      qrySelBensCustom.SQL.Add('        PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCLASSE,          ');
      qrySelBensCustom.SQL.Add('        S.DESCSITUACAO,                                                         ');
      qrySelBensCustom.SQL.Add('        (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALORG0,           ');
      qrySelBensCustom.SQL.Add('        (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBEM0,            ');
      qrySelBensCustom.SQL.Add('        (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPLANC0,          ');
      qrySelBensCustom.SQL.Add('        (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDEP0,            ');
      qrySelBensCustom.SQL.Add('        (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +                         ');
      qrySelBensCustom.SQL.Add('         SB.REAVVALORG + SB.REAVCMBEM -                                         ');
      qrySelBensCustom.SQL.Add('         SB.REAVDEPLANC - SB.REAVCMDEP +                                        ');
      qrySelBensCustom.SQL.Add('         SB.ULTREAVVALORG + SB.ULTREAVCMBEM -                                   ');
      qrySelBensCustom.SQL.Add('         SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALCTB0            ');
      qrySelBensCustom.SQL.Add(' FROM BEM         B, GRUPO       G,                                             ');
      qrySelBensCustom.SQL.Add('      CLASSEDEBEM CB,                                                           ');
      qrySelBensCustom.SQL.Add('      CONJUNTO    C,                                                            ');
      qrySelBensCustom.SQL.Add('      LOCALIZACAO L,                                                            ');
      qrySelBensCustom.SQL.Add('      CENTCUST    CC,                                                           ');
      qrySelBensCustom.SQL.Add('      PESSOA      PR,                                                           ');
      qrySelBensCustom.SQL.Add('      PESSOA      PF,                                                           ');
      qrySelBensCustom.SQL.Add('      SITUACAO    S,                                                            ');
      qrySelBensCustom.SQL.Add('      (SELECT SCB.IDBEM, SCB.DATASLDBEM,                                        ');
      qrySelBensCustom.SQL.Add('              SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,                  ');
      qrySelBensCustom.SQL.Add('              SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,                   ');
      qrySelBensCustom.SQL.Add('              SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,                 ');
      qrySelBensCustom.SQL.Add('              SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP                    ');
      qrySelBensCustom.SQL.Add('      FROM SALDOCONTABBEM SCB,                                                  ');
      qrySelBensCustom.SQL.Add('           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA                               ');
      qrySelBensCustom.SQL.Add('            FROM SALDOCONTABBEM                                                 ');
      qrySelBensCustom.SQL.Add('            WHERE (DATASLDBEM <= :PDATASLD)                                     ');
      qrySelBensCustom.SQL.Add('            GROUP BY IDBEM) DTAMAX                                              ');
      qrySelBensCustom.SQL.Add('      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)                                      ');
      qrySelBensCustom.SQL.Add('        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB                                     ');
      qrySelBensCustom.SQL.Add('                                                                                ');
      qrySelBensCustom.SQL.Add('WHERE (B.DATAINICIODEP <= :PDATASLD)                                            ');
      qrySelBensCustom.SQL.Add('  AND (G.FLGIMOVEL = 0)                                                         ');
      //----------------------------------------------------------------------------------
      // Processa a lista de bens que serão impressos
      //----------------------------------------------------------------------------------
      iNBens := 0;
      qryDet.First;
      while not qryDet.EOF do
      begin
         if iNBens = 0 then
         begin
            qrySelBensCustom.SQL.Add('  AND (   (B.IDBEM = '+qryDet.FieldByName('IDBEM').AsString+') ');
         end else
         begin
            qrySelBensCustom.SQL.Add('       OR (B.IDBEM = '+qryDet.FieldByName('IDBEM').AsString+') ');
         end;
         iNBens := iNBens + 1;
         qryDet.Next;
      end;
      qryDet.CancelUpdates;
      //----------------------------------------------------------------------------------
      if iNBens <> 0 then
         qrySelBensCustom.SQL.Add('      ) ');
      //----------------------------------------------------------------------------------
      qrySelBensCustom.SQL.Add('  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))                                      ');
      qrySelBensCustom.SQL.Add('  AND (B.IDGRUPO        = G.IDGRUPO(+))                                         ');
      qrySelBensCustom.SQL.Add('  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))                                   ');
      qrySelBensCustom.SQL.Add('  AND (C.IDRESPONSAVEL  = PR.IDPESSOA(+))                                       ');
      qrySelBensCustom.SQL.Add('  AND (B.IDFORNSERV     = PF.IDPESSOA(+))                                       ');
      qrySelBensCustom.SQL.Add('  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                                 ');
      qrySelBensCustom.SQL.Add('  AND (L.IDEMPRESA      = CC.IDEMPRESA(+))                                      ');
      qrySelBensCustom.SQL.Add('  AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))                                    ');
      qrySelBensCustom.SQL.Add('  AND (B.IDSITUACAO     = S.IDSITUACAO(+))                                      ');
      qrySelBensCustom.SQL.Add('  AND (B.IDBEM          = SB.IDBEM(+))                                          ');
      qrySelBensCustom.SQL.Add('ORDER BY B.PLACA                                                                ');
      //----------------------------------------------------------------------------------
      qrySelBensCustom.ParamByName('PDATASLD').AsDateTime := dteDataMov.Date;
      qrySelBensCustom.Open;
      Screen.Cursor := crDefault;
      if qrySelBensCustom.IsEmpty then
         MsgDlg('Não existem bens com os paramêtros fornecidos!', 'Erro', mtError, [mbOk], 0);
      //----------------------------------------------------------------------------------
      ppLabel121.Caption := eSubTitulo.Text;
   end;
end;
//========================================================================================
procedure TfrmParamCadBensCustom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryDet.CancelUpdates;
   qryDet.Close;
   qryDet.Unprepare;
end;
//========================================================================================
procedure TfrmParamCadBensCustom.bbtnSelBensClick(Sender: TObject);
begin
   inherited;
   frmSelBem := TfrmSelBem.Create(Self);
   frmSelBem.FormStyle := FsNormal;
   frmSelBem.Visible   := False;
   frmSelBem.Top       := 84;
   frmSelBem.ShowModal;
   //-------------------------------------------------------------------------------------
   if frmSelBem.bResult then
   begin
      qryDet.DisableControls;
      frmSelBem.qry.First;
      while not frmSelBem.qry.EOF do
      begin
         if (frmSelBem.qryPROCESSAR.AsInteger = 1) then
         begin
            qryDet.Append;
            qryDetIDPESSOA.AsInteger := frmSelBem.qryIDPESSOA.AsInteger;
            qryDetIDBEM.AsInteger    := frmSelBem.qryIDBEM.AsInteger;
            qryDetPLACA.AsInteger    := frmSelBem.qryPLACA.AsInteger;
            qryDetDESBEM.AsString    := frmSelBem.qryDESBEM.AsString;
            qryDet.Post;
         end;
         //-------------------------------------------------------------------------------
         frmSelBem.qry.Next;
      end;
      qryDet.First;
      qryDet.EnableControls;
   end;
   //-------------------------------------------------------------------------------------
   frmSelBem.qry.Close;
   frmSelBem.qry.UnPrepare;
   frmSelBem.Release;
end;

end.


