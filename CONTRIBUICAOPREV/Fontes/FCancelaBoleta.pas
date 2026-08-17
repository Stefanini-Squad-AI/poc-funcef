unit FCancelaBoleta;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------

// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid, Wwquery, TEdNum, UCtrlDocumento, UCtrlLancamento;

type
  TfrmCancelaBoleta = class(TfrmOkCancelar)
    Label1: TLabel;
    edQtdeDias: TEditNum;
    Label2: TLabel;
    Label3: TLabel;
    qryPlano: TwwQuery;
    dbgrdPlano: TwwDBGrid;
    dsPlano: TwwDataSource;
    updPlano: TUpdateSQL;
    BitBtn1: TBitBtn;
    qryContribuicao: TwwQuery;
    qryAux: TwwQuery;
    qryAux2: TwwQuery;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private // Private declarations

    CtrlDocumento           : TCtrlDocumento;
    CtrlLancamento          : TCtrlLancamento;


  public  // Public declarations


  end;



var
  frmCancelaBoleta: TfrmCancelaBoleta;



implementation
{$R *.DFM}
uses
  fAguarde,UMensErro,DBaseDados,UContribuicaoPrev, UAdmPrev, Usistema;




procedure TfrmCancelaBoleta.FormShow(Sender: TObject);
begin
  inherited;
  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPlano.Open;
  edQtdeDias.Text := '90';
end;

procedure TfrmCancelaBoleta.bbtnConfirmarClick(Sender: TObject);
var bAlgumSelecionado,
    bOk               : boolean;
    sMsgErro,
    sCamposObrig,
    sIdsPlanos,
    sSQL              : string;
    iOrdem            : integer;
    iUltimaContrib    : longint;
begin
  inherited;

  // Verificar se o no. de meses está preenchido
  if Trim(edQtdeDias.Text) = ''
  then begin
     MsgDlg('Informe o nº de dias de atraso desejado. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Verificar se nenhum plano está selecionado
  qryPlano.DisableControls;
  qryPlano.First;
  bAlgumSelecionado := False;
  sIdsPlanos        := ' ';
  while not qryPlano.Eof do
  begin
     if qryPlano.FieldByName('FlgSelecionado').AsInteger = 1 then
     begin
        bAlgumSelecionado := True;
        sIdsPlanos := sIdsPlanos +', '+qryPlano.FieldByName('IdPlanoPrev').AsString+'';
     end;
     qryPlano.Next;
  end;

  sIdsPlanos := Copy(Trim(sIdsPlanos),2,length(Trim(sIdsPlanos))-1);
  qryPlano.EnableControls;

  if not bAlgumSelecionado
  then begin
     qryPlano.First;
     MsgDlg('Selecione algum plano ou utilize a opção "Selecionar Todos". ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Selecionar contribuicao na situacao especificada
  frmAguarde.Mostra('Verificando contribuições ...');
  qryContribuicao.Close;
  qryContribuicao.SQL.Clear;

  qryContribuicao.SQL.Add(' SELECT TRUNC(TO_DATE('''+DateToStr(date)+''',''DD/MM/YYYY'') - HST.DATAPREVISAORECE,0),'+
                          '        HST.IDPESSOA, HST.MESREFERENCIA,      HST.MESCOBRANCA,  HST.DATAPREVISAORECE,   '+
                          '        HST.NUMRECEBIMENTO,     HST.IDMOTIVO,     HST.IDCONTRIBUICAO,                   '+
                          '        HST.CODDOCUMENTOPREV                                                            '+
                          ' FROM   HSTCONTRIBPREV HST                                                              '+
                          ' WHERE  (HST.IDPLANOPREV  IN ('+sIdsPlanos+'))                                          '+
                          ' AND    (TO_DATE('''+DateToStr(date)+''',''DD/MM/YYYY'') > HST.DATAPREVISAORECE)        '+
                          ' AND    (HST.FLGDESCFOLHA = 0)                                                          '+
                          ' AND    (HST.SITRECEBIMENTO = ''1'')                                                        '+
                          ' AND    (HST.DATAPREVISAORECE IS NOT NULL)                                              '+
                          ' GROUP BY HST.IDPESSOA,  HST.MESREFERENCIA,  HST.MESCOBRANCA, HST.DATAPREVISAORECE,     '+
                          '          HST.NUMRECEBIMENTO, HST.IDMOTIVO,    HST.IDCONTRIBUICAO, HST.CODDOCUMENTOPREV '+
                          ' HAVING TRUNC(TO_DATE('''+DateToStr(date)+''',''DD/MM/YYYY'') - HST.DATAPREVISAORECE,0) >= '+Trim(edQtdeDias.Text));

  qryContribuicao.Open;

  if qryContribuicao.IsEmpty
  then begin
     qryContribuicao.Close;
     frmAguarde.Apaga;
     MsgDlg('Nenhum contribuição encontrada na situação especificada. Verifique. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSQL(qryAux);
     Exit;
  end;

  frmAguarde.Apaga;
  if MsgDlg('Foram encontradas '+IntToStr(qryContribuicao.RecordCount)+
            ' contribuições na situação especificada. Confirma ? ',
            'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
  then begin
     qryContribuicao.Close;
     TiraSQL(qryAux);
     Exit;
  end;

  dtmBaseDados.dbBaseDados.StartTransaction;
  bOk := True;
  iOrdem := 1;
  iultimacontrib := -1;
  

  frmAguarde.Mostra('Cancelando Contribuições ...');
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     sCamposObrig := '';

     // Atualizar sitrecebimento para 8 (cancelada e pode ser reenviado )
     qryAux.Close;
     qryAux.SQL.Clear;

     qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = ''8'', CODDOCUMENTOPREV = NULL, VALORRECEBIDO = NULL, '+
                    '                          DATARECEBIMENTO =  NULL,   '+
                    '                          DATACANCELAMENTO = SYSDATE '+
                    ' WHERE  MESREFERENCIA  = '''+qryContribuicao.FieldByName('MesReferencia').AsString+''''+
                    ' AND    MESCOBRANCA    = '''+qryContribuicao.FieldByName('MesCobranca').AsString+''''+
                    ' AND    NUMRECEBIMENTO =   '+qryContribuicao.FieldByName('NumRecebimento').AsString+
                    ' AND    IDMOTIVO       =   '+qryContribuicao.FieldByName('IdMotivo').AsString);
     try
        qryAux.ExecSQL;
     except
        if MsgDlg(' Erro na atualização da situação da contribuição. Deseja continuar ? ',
               'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           break;
        end
        else begin
           qryContribuicao.Next;
           bOk := False;
           continue;
        end;
     end;

     bOK   := EstornaContribuicaoBANCO ( CtrlDocumento,
                                         CtrlLancamento,
                                         qryContribuicao.FieldByName('CodDocumentoPrev').AsInteger,
                                         qryAux,
                                         qryAux2,
                                         qryContribuicao.FieldByName('MesReferencia').AsString,
                                         sMsgErro);


     if not bOk
     then begin
        if MsgDlg('Erro no estorno ['+sMsgErro+']','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo

        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           break;
        end
        else begin
           qryContribuicao.Next;
           bOk := False;
           continue;
        end;
     end;

     iultimacontrib :=   qryContribuicao.FieldByName('IdContribuicao').AsInteger;
     inc(iOrdem);
     qryContribuicao.Next;
  end;

  frmAguarde.Apaga;


  if bOk then
  begin
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

    dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Cancelamento de Contribuições efetuado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0)
  end
  else begin
    if MsgDlg('Cancelamento de Contribuições efetuado com alguns problemas. Deseja efetivar ?',
              'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
    then dtmBaseDados.dbBaseDados.RollBack
    else dtmBaseDados.dbBaseDados.Commit;
  end;

  frmAguarde.Apaga;
end;



procedure TfrmCancelaBoleta.BitBtn1Click(Sender: TObject);
begin
  inherited;
  qryPlano.First;
  while not qryPlano.Eof do
  begin
     qryPlano.Edit;
     qryPlano.FieldByName('FlgSelecionado').AsInteger := 1;
     qryPlano.Post;
     qryPlano.Next;
  end;
  dbgrdPlano.RefreshDisplay;
end;



procedure TfrmCancelaBoleta.FormCreate(Sender: TObject);
begin
  inherited;
   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
      Abort;
   end;

   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;
end;



procedure TfrmCancelaBoleta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlLancamento );
  inherited;
end;



end.