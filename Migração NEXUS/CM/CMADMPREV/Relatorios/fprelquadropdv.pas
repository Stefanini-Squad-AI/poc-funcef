// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FpRelQuadroPdv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Mask, wwdblook;

type
  TFrmParamRelPdvReg = class(TfrmOkCancelar)
    Label1: TLabel;
    dblckPatro: TwwDBLookupCombo;
    sMesCob: TMaskEdit;
    Label2: TLabel;
    dblkpEvento: TwwDBLookupCombo;
    Label3: TLabel;
    qryPatro: TwwQuery;
    qryEventoPdv: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sMesCobraAux, sMesAnt : string;
    iFlgInterno  : Integer;
  public
    { Public declarations }
  end;

var
  FrmParamRelPdvReg: TFrmParamRelPdvReg;

implementation

uses
  UDataBase, UMensErro, FTelaAut, DBaseDados, DRelatAdmPrev,
  UFuncoesUteis, UAdmPrev;

{$R *.DFM}

procedure TFrmParamRelPdvReg.bbtnConfirmarClick(Sender: TObject);
begin
if dblckPatro.Text = ''
  then begin
     MsgDlg('O Patrocinadora não foi informada.','Informação',mtInformation,[mbOk,mbHelp],0);
     dblckPatro.SetFocus;
     Exit;
  end;

  if dblkpEvento.Text = ''
  then begin
     MsgDlg('O Programa de demissão não foi informado.','Informação',mtInformation,[mbOk,mbHelp],0);
     dblkpEvento.SetFocus;
     Exit;
  end;

  if sMesCob.Text = ''
  then begin
     MsgDlg('O mês de referência não foi informado.','Informação',mtInformation,[mbOk,mbHelp],0);
     sMesCob.SetFocus;
     Exit;
  end;                       
  inherited;

  sMesCobraAux := Copy(sMesCob.Text,4,4)+'/'+Copy(sMesCob.Text,1,2);

  // mes anterior
  if Copy(sMesCob.Text,1,2) = '01' then {janeiro}
    sMesAnt := InttoStr(StrtoInt(Copy(sMesCob.Text,4,4))-1)+'/12'
  else
    sMesAnt := Copy(sMesCob.Text,4,4)+'/'+Colocazeros(InttoStr(StrtoInt(Copy(sMesCob.Text,1,2))-1),2);

  try
        dtmRelatAdmPrev.qryFundacao.Close;
        dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger;
        dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
        dtmRelatAdmPrev.qryFundacao.Prepare;
        dtmRelatAdmPrev.qryFundacao.Open;

        dtmRelatAdmPrev.rpRegionaisPdvLabel5.text := sMesCob.Text;
        dtmRelatAdmPrev.rpRegionaisPdvLabel2.text := dblkpEvento.Text;

        if pos(UpperCase('demiss'),UpperCase(dblkpEvento.Text)) > 0
        then iFlgInterno := 6
        else iFlgInterno := 7;

        dtmRelatAdmPrev.qryRegionaisPdv.Close;
        dtmRelatAdmPrev.qryRegionaisPdv.ParamByName('MESCOB').AsString     := sMesCobraAux;
        dtmRelatAdmPrev.qryRegionaisPdv.ParamByName('IDPATRO').AsInteger   := qryPatro.FieldByName('IDPESSOA').AsInteger;
        dtmRelatAdmPrev.qryRegionaisPdv.ParamByName('FLGINTERNO').AsInteger:= iFlgInterno;
        dtmRelatAdmPrev.qryRegionaisPdv.ParamByName('MESCOBANT').AsString  := sMesAnt;
        dtmRelatAdmPrev.qryRegionaisPdv.Open;

        if dtmRelatAdmPrev.qryRegionaisPdv.IsEmpty
        then begin
             dtmRelatAdmPrev.qryRegionaisPdv.Close;
             MsgDlg('Não encontrou participantes em PDV nesta patrocinadora.','Informação',mtInformation,[mbOk,mbHelp],0);
             Exit;
        end;
  except

  end;

end;

procedure TFrmParamRelPdvReg.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;

  qryEventoPdv.Close;
  qryEventoPdv.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryEventoPdv.Open;
end;

procedure TFrmParamRelPdvReg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
  qryEventoPdv.Close;
end;

end.
