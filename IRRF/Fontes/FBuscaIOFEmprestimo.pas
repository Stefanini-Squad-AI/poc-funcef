unit FBuscaIOFEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmBuscaIOFEmprestimo = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    dblcNatRendMantido: TwwDBLookupCombo;
    lblNatMan: TLabel;
    qryNatRendimento: TwwQuery;
    qryDocumento: TwwQuery;
    qryProcura: TwwQuery;
    qryInfo: TwwQuery;
    bbtnConfirmaGeracao: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryAux: TwwQuery;
    updAux: TUpdateSQL;
    qryDePara: TwwQuery;
    qryDeParaIDPLANPREVC: TFloatField;
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure PegaIDItemIOF(var IdiTemIof, IdPrograma : longInt; var CodCentroCusto : string; IdEmpresaProp : Longint);
    function FazDePara(iPlanoPrev : LongInt) : LongInt;
  public
    { Public declarations }
  end;

var
  frmBuscaIOFEmprestimo: TfrmBuscaIOFEmprestimo;

implementation

Uses uMensErro, uSistema, ULancIRRF, uDataBase, DBaseDados;
{$R *.DFM}

procedure TfrmBuscaIOFEmprestimo.bbtnConfirmaGeracaoClick(Sender: TObject);
Var
  IdiTemIOF, IdPrograma,
  iPlanoPrevC, iPlanoPrev, iPatro : LongInt;
  iBenef, iCodLanc, rValor : Double;
  CodCentroCusto : string;
  bPrimVez : boolean;
  dData    : TDateTime;
begin
  inherited;
  bPrimVez := True;
  if dtFim.Date < dtInicio.date then
     Begin
       MsgDlg('Data final não pode ser menor que a inicial.','Aviso',mtWarning,[mbOK],0);
       dtFim.date := dtInicio.date;
       exit;
     end
  else
  if dtFim.Date > Date then
     Begin
       MsgDlg('Data final não pode ser maior que a corrente.','Aviso',mtWarning,[mbOK],0);
       exit;
     end
  else
  if Trim(dblcNatRendMantido.LookupValue) = '' then
     Begin
       MsgDlg('Por favor, preencha a natureza de rendimento.','Aviso',mtWarning,[mbOK],0);
       dblcNatRendMantido.SetFocus;
       exit;
     end;

  PegaIDItemIOF(IdiTemIOF, IdPrograma, CodCentroCusto, Sistema.idEmpresa);
  with qryDocumento do
    Begin
      Close;
      sql.Clear;
      sql.Append('SELECT H.HMEVLRPREVISTO AS VLRPREVISTO, H.HMEDATAPREVISTA,');
      sql.Append('       C.IDPATRO, C.IDPLANOPREV, H.IDHISTMOVEMPTMO, C.IDBENEF ');
      sql.Append('  FROM HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEMPTMO TE, ');
      sql.Append('   (                   ');
      sql.Append('   SELECT              ');
      sql.Append('      IDCONTRATOEMPTMO ');
      sql.Append('   FROM                ');
      sql.Append('      HISTMOVEMPTMO    ');
      sql.Append('   WHERE               ');
      sql.Append('       ( hmeparcela = 0 )                                        ');
      sql.Append('   and ( hmecentraliza = 1 )                                     ');
      sql.Append('   and ( flgbaixado is null )                                    ');
      sql.Append('   and ( (flgestornado is null) and (plncodigoestorno is null) ) ');
      sql.Append('   AND (IDLANCIRRF IS NULL)');
      sql.Append('   AND (HMEDATAPREVISTA BETWEEN :DATAINI AND :DATAFIM)         ');
      sql.Append('   group by IDCONTRATOEMPTMO ) HCB                                                         ');
      sql.Append(' WHERE (H.IDITEMEMPTMO     = :IDITEMEMPTMO)  ');
      sql.Append('   AND (TE.IDEMPRESAPROP   = :IDEMPRESAPROP) ');
      sql.Append('   AND (H.IDLANCIRRF IS NULL)');
      sql.Append('   AND (H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO)');
      sql.Append('   AND (H.IDCONTRATOEMPTMO = HCB.IDCONTRATOEMPTMO)');
      sql.Append('   AND (C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO)');
      sql.Append('   AND (TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO)');
      sql.Append('   AND (H.HMEDATAPREVISTA BETWEEN :DATAINI AND :DATAFIM)');
      sql.Append(' ORDER BY H.HMEDATAPREVISTA, C.IDPATRO, C.IDPLANOPREV,C.IDBENEF');
      ParamByName('IDITEMEMPTMO').AsInteger  := IdiTemIOF;
      ParamByName('IDEMPRESAPROP').AsInteger := Sistema.idEmpresa;
      ParamByName('DATAINI').AsDate          := dtInicio.Date;
      ParamByName('DATAFIM').AsDate          := dtFim.Date;
      open;
      Try
        startTransacao;
        First;
        While not EOF do
          Begin
            rValor      :=0;
            dData       :=FieldByName('HMEDATAPREVISTA').AsDateTime;
            iPlanoPrev  :=FieldByName('IDPLANOPREV').AsInteger;
            iPlanoPrevC :=FazDePara(FieldByName('IDPLANOPREV').AsInteger);
            iPatro      :=FieldByName('IDPATRO').AsInteger;
            iBenef      :=FieldByName('IDBENEF').AsFloat;
            qryAux.Close;
            qryAux.Open;
            While (not EOF) and (dData = FieldByName('HMEDATAPREVISTA').AsDateTime) and
                  (iPlanoPrev = FieldByName('IDPLANOPREV').AsInteger) and
                  (iPatro     = FieldByName('IDPATRO').AsInteger) and
                  (iBenef     = FieldByName('IDBENEF').AsFloat) do
              Begin
                rValor := rValor + FieldByName('VLRPREVISTO').AsFloat;
                qryAux.Insert;
                qryAux.FieldByName('IDHISTMOVEMPTMO').AsFloat:=FieldByName('IDHISTMOVEMPTMO').AsFloat;
                qryAux.Post;
                Next;
              end;
            iCodLanc := 0;
            LancIRRF.GravaIRRF(0,Sistema.idEmpresa,iBenef,dblcNatRendMantido.LookupValue,
                        DateToStr(dData),0,0,0,0,0,0,
                        qryInfo,iCodLanc,'',0 ,'N', iPlanoPrevC, iPatro,
                        IdPrograma,bPrimVez,15, 0, CodCentroCusto,-1, rValor);
            qryAux.First;
            while not qryAux.Eof do
              begin
                qryInfo.close;
                qryInfo.sql.Clear;
                qryInfo.sql.Add('UPDATE HistMovEmptmo SET IDLANCIRRF = '+FloatToStr(iCodLanc));
                qryInfo.sql.Add(' WHERE IDHISTMOVEMPTMO = '+FloatToStr(qryAux.FieldByName('IDHISTMOVEMPTMO').AsFloat));
                qryInfo.ExecSQL;
                qryAux.Next;
              end;
          end;
        CommitTransacao;
        MsgDlg('Geração Efetuada com Sucesso','Aviso',mtWarning,[mbOK],0);
      Except
        RollBackTransacao;
        MsgDlg('Erro na Geração','Erro',mtError,[mbOK],0);
        Raise;
      end;
    end;
end;

procedure TfrmBuscaIOFEmprestimo.PegaIDItemIOF(var IdiTemIof, IdPrograma: longInt; var CodCentroCusto : string; IdEmpresaProp : Longint);
begin
  with qryProcura do
    Begin
      sql.clear;
      sql.Append('SELECT IDITEMIOF, IDPROGRAMA, CODCENTROCUSTO, IDEMPRESA');
      sql.Append('  FROM PARAMEMPTMO');
      sql.Append(' WHERE IDEMPRESAPROP = '+ intTostr(IdEmpresaProp));
      open;
      IdiTemIof      := fieldByname('IDITEMIOF').Asinteger;
      IdPrograma     := fieldByname('IDPROGRAMA').Asinteger;
      CodCentroCusto := fieldByname('CODCENTROCUSTO').Asstring;
    end;
end;

procedure TfrmBuscaIOFEmprestimo.FormShow(Sender: TObject);
begin
  qryNatRendimento.close;
  qryNatRendimento.Open;
  inherited;
end;



function TfrmBuscaIOFEmprestimo.FazDePara(iPlanoPrev: Integer): LongInt;
begin
   qryDePara.Close;
   qryDePara.ParamByName('IDPLANOPREV').AsInteger := iPlanoPrev;
   qryDePara.Open;
   if qryDePara.IsEmpty then
      Result := iPlanoPrev
   else
      Result := qryDeParaIDPLANPREVC.AsInteger;
end;

end.



