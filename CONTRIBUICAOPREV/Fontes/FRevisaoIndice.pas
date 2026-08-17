//***************************************************************************************
//***********************-----HISTÓRICO DE ALTERAÇÕES-----*******************************
//***************************************************************************************
//***************************************************************************************
//Nº SIG:            27626.32406
//Data da Alteração: 28/07/2015
//Alteração Form:    mudar chamada de atualização para PCK_BENEFSALDFAB.SP_ATUALIZASALDO
//Responsável:       William Santana
//Descrição:         Ajustes para chamada package pck.BenefSaldFab
//***************************************************************************************
//Nº SOL:            145044
//Nº KINTANA         966308
//Data da Alteração: 12/05/2014
//Alteração Form:    Criação do form
//Responsável:       Tadeu Passos/ Douglas Siqueira / Higor Nayde / William Santana
//Descrição:         Benefício Saldado e FAB
//**************************************************************************************

unit FRevisaoIndice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, dBaseDados, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, wwstorep, UMensErro;


type
  TfrmRevisaoIndice = class(TfrmOkCancelar)
    Label2: TLabel;
    tmpckrRevisao: TCMDateTimePicker;
    qryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime) : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRevisaoIndice: TfrmRevisaoIndice;

implementation

uses FProgresso, fCargaArquivo;

{$R *.DFM}

procedure TfrmRevisaoIndice.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if tmpckrRevisao.text = EmptyStr then
  begin
    MsgDlg('A data de revisão é obrigatória.','Atenção',mtWarning,[mbOk],0);
    exit;
  end;

  if tmpckrRevisao.date <= strtodate('31/08/2006') then
  begin
    MsgDlg('A data de revisão deverá ser maior que 31/08/2006.','Atenção',mtWarning,[mbOk],0);
    exit;
  end ;

  try
   if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

    qryAux.Close;
    qryAux.Sql.clear;
    qryAux.Sql.Add(' INSERT INTO HSTALTBENEFSALDFAB (IDHSTALTBENEFSALDFAB, IDPESSOA, IDTITULAR, ');
    qryAux.Sql.Add(' TIPO, CAMPO, VALORANTERIOR, VALORALTERADO, MESREFERENCIA)'                  );
    qryAux.Sql.Add(' SELECT SEQHSTALTBENEFSALDFAB.NEXTVAL, B.IDPESSOA, B.IDTITULAR, ''R'' TIPO, B.INDICE CAMPO,' );
    qryAux.Sql.Add(' TO_CHAR(B.VALORINDICE), TO_CHAR(C.COTVALOR) , B.MESREFERENCIA'              );
    qryAux.Sql.Add(' FROM COTACAOMOEDA C, BENEFSALDFAB B'                                        );
    qryAux.Sql.Add(' WHERE C.MOECODIGO IN (7,322)'                                               );
    qryAux.Sql.Add(' AND TO_CHAR(C.COTDATA,''MM/YYYY'') = B.MESREFERENCIA'                       );
    qryAux.Sql.Add(' AND DECODE(C.MOECODIGO,7,''INPC'',322,''IRFBS'') = B.INDICE'                );
    qryAux.Sql.Add(' AND B.MESREFERENCIA = '+ QuotedStr(Copy(tmpckrRevisao.Text,4,7))            );
    qryAux.ExecSQL;

    qryAux.Close;
    qryAux.Sql.clear;
    qryAux.Sql.Add('DELETE FROM BENEFSALDFAB WHERE TO_DATE(''01''||MESREFERENCIA) > '+ QuotedStr(tmpckrRevisao.Text));
    qryAux.Sql.Add(' AND INDICE IS NOT NULL ' );
    qryAux.ExecSQL;

    qryAux.Close;
    qryAux.Sql.clear;
    qryAux.Sql.Add('UPDATE CARGABENEFSALDFAB SET ULTIMOMESPROC = '+ QuotedStr(Copy(tmpckrRevisao.Text,4,7)));
    qryAux.ExecSQL;

    if dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.Commit;

    Screen.Cursor := crHourGlass;
    if  Exec_SP_Atualiza_Benef_Sald_FAB(1,Date()) then
      MsgDlg('Atualização Concluída.','Atenção',mtInformation,[mbOk],0)
    else
     MsgDlg('Ocorreu um erro, a atualização não foi concluída.','Atenção',mtInformation,[mbOk],0);
    Screen.Cursor := crDefault;

  except
    if dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.Rollback;
  end;

  bbtnSair.Click;
end;

function TfrmRevisaoIndice.Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime) : Boolean;
var
  SP_PROC : TStoredProc;
begin
  frmProgresso.MostraFormProgresso('Atualizando Benefício Saldado e FAB, por favor, aguarde.', True, False,False);
  frmProgresso.lblContador.Caption := '';
  frmProgresso.btnCancelar.Visible := False;
  frmProgresso.Panel1.Visible := False;
  frmProgresso.Refresh;

  try

    try
      SP_PROC := TStoredProc.Create(Self);
      SP_PROC.DatabaseName  := 'BaseDados';
      //SP_PROC.StoredProcName := 'CM."SP_ATUALIZA_BENEF_SALD_FAB"';  //William Santana - SIG 27626.32406
      SP_PROC.StoredProcName  := 'CM.PCK_BENEFSALDFAB.SP_ATUALIZASALDO';  //William Santana - SIG 27626.32406


      //Criando os parametros
      SP_PROC.Params.CreateParam(ftInteger, 'pAtualizarTudo', ptInput);
      SP_PROC.Params.CreateParam(ftDateTime, 'pAtualizarAte', ptInput);

      //Passandos os parâmetros
      SP_PROC.ParamByName('pAtualizarTudo').AsInteger := AtualizarTudo;
      SP_PROC.ParamByName('pAtualizarAte').AsDate     := AtualizarAte ;

      if not SP_PROC.Prepared then
         SP_PROC.Prepare;

      SP_PROC.Close;
      SP_PROC.ExecProc;
      Result := True;
      SP_PROC.Close;

    except
       Result := False;          
    end;
     
  finally
    FreeAndNil(SP_PROC);
    frmProgresso.EscondeFormProgresso;
  end;
end;

procedure TfrmRevisaoIndice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCargaArquivo.Enabled := true;
end;

end.

