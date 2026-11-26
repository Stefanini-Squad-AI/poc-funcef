// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Fanuel Junior
// Data        : 14/06/2004
// Pendencia   : SOL 159394 Kintana 1309742
// Descrição   : Erro no IDEVENTOGERADOR
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.08.2004
// Pendencia   : -----
// Rotina      : qrySitPart
// Descrição   : Permitir que a situacao na fundacao não mude
//------------------------------------------------------------------------------
unit FLerSituacaoPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, Db,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery, TB97, wwdblook,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmLerSituacaoPlano = class(TfrmOkCancelar)
    qrySitPlanoPrev: TwwQuery;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    Label12: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qrySitPart: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     sflgInterno, sIdEvento : string[3];  //Fanuel Junior SOL159394 Kintana1309742
     sMensagem, sMensFund   : string;
     bBotaoOk: boolean;
  end;

var
  frmLerSituacaoPlano: TfrmLerSituacaoPlano;

implementation

uses
    uMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmLerSituacaoPlano.FormActivate(Sender: TObject);
begin
  inherited;

  qrySitPlanoPrev.Close;
  qrySitPlanoPrev.ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEvento);
  qrySitPlanoPrev.Open;

  qrySitPart.Close;
  qrySitPart.SQL.Clear;
  qrySitPart.SQL.Add( ' SELECT * FROM                                                                                                '+
                      ' (                                                                                                            ');
  if sflgInterno = 'RI'
  then qrySitPart.SQL.Add( ' SELECT 1 AS TIPO, ''<Manter Situação Atual>'' AS DESCRICAO, -1 AS IDSITPART, ''XX'' AS FLGINTERNO FROM DUAL  '+
                           ' UNION                                                                                                        ');
  qrySitPart.SQL.Add( ' SELECT 2 AS TIPO, SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO                                              '+
                      ' FROM   SITPART SIT , EVENTOXSITPART E                                                                        '+
                      ' WHERE  SIT.IDSITPART = E.IDSITPART                                                                           '+
                      ' AND    E.IDEVENTOGERADOR = '+OraNumero(sIdEvento)                                                             +
                      ' )                                                                                                            '+
                      ' ORDER BY TIPO, DESCRICAO                                                                                     ');
  qrySitPart.Open;
  qrySitPart.First;


  if sflgInterno = 'RI'
  then begin
     dblkpcmbSitPart.Text := qrySitPart.FieldByName('DESCRICAO').AsString;
     dblkpcmbSitPart.PerformSearch;
  end;
end;

procedure TfrmLerSituacaoPlano.FormShow(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerSituacaoPlano.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then
     begin
          MsgDlg(sMensagem,'Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  if Trim(dblkpcmbSitPart.Text) = '' then
     begin
          MsgDlg(sMensFund,'Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  bBotaoOk := True;
  Close;
end;

procedure TfrmLerSituacaoPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
  Close;
end;

procedure TfrmLerSituacaoPlano.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False;
end;

procedure TfrmLerSituacaoPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// inherited; {Nao tirar o Comentário} 
   Close;
end;

end.
