// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)       : Jéssica Lana Nunes dos Santos
// Data           : 05/03/2009
// Pendência      : SOL 109421 KINTANA 496332
// Descricao      : Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FAtualizaSalario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, checklst;

type
  TfrmAtualizaSalario = class(TfrmSairAjuda)
    qryPatro: TwwQuery;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    chklstSituacao: TCheckListBox;
    Label2: TLabel;
    bbtnReceber: TBitBtn;
    qryParticipantes: TwwQuery;
    Label3: TLabel;
    Button1: TButton;
    qry: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnReceberClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizaSalario: TfrmAtualizaSalario;

implementation

uses DBaseDados, UAdmPrev, UMensErro, DAPrev, USistema;

{$R *.DFM}

procedure TfrmAtualizaSalario.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.Open;
end;

procedure TfrmAtualizaSalario.bbtnReceberClick(Sender: TObject);
var sNomeRubrica, sNomeSalario, sSituacao, sSalario : string;
    i : word;
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  for i := 0 to 2 do
  begin
     if not chklstSituacao.Checked[i] then continue;

     case i of
          0 : sSituacao := 'AT';
          1 : sSituacao := 'MA';
          2 : sSituacao := 'MP';
     end; // case

     qryParticipantes.Close;
     qryParticipantes.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
     qryParticipantes.ParamByName('Situacao').AsString := sSituacao;
     qryParticipantes.Open;

     qryParticipantes.First;
     while not qryParticipantes.Eof do
     begin
        if qryParticipantes.FieldByName('FlgInterno').AsString = 'AT'
        then begin
           sNomeRubrica := 'IDRUBSALPARTICIP';
           sNomeSalario := 'SALPARTICIPACAO';
        end
        else if qryParticipantes.FieldByName('FlgInterno').AsString = 'MA'
             then begin
                sNomeRubrica := 'IDRUBSALMANUT';
                sNomeSalario := 'SALMANTIDO';
             end
             else begin
                sNomeRubrica := 'IDRUBSALMANUTPARC';
                sNomeSalario := 'SALMANTIDO';
             end;

        with dtmAPrev.qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT VALORPROVENTO '+
                   ' FROM   HISTRUBSAL    '+
                   ' WHERE  IDPESSJUR = '+qryParticipantes.FieldByName('IdPessJur').AsString+
                   ' AND    IDPESSOA  = '+qryParticipantes.FieldByName('IdPessoa').AsString+
                   ' AND    IDRUBRICA = '+qryPatro.FieldByName(sNomeRubrica).AsString+
                   ' AND    MES       = (SELECT MAX(MES) '+
                   '                     FROM   HISTRUBSAL '+
                   '                     WHERE  IDPESSJUR = '+qryParticipantes.FieldByName('IdPessJur').AsString+
                   '                     AND    IDPESSOA  = '+qryParticipantes.FieldByName('IdPessoa').AsString+
                   '                     AND    IDRUBRICA = '+qryPatro.FieldByName(sNomeRubrica).AsString+
                   '                    ) ');
           Open;
           if (IsEmpty) or (FieldByName('ValorProvento').AsFloat <= 0)
           then begin
              qryParticipantes.Next;
              continue;
           end;

           sSalario := OraNumero(FieldByName('ValorProvento').AsString);

           Close;
           SQL.Clear;
           SQL.Add(' UPDATE PARTPREVPLAN SET '+sNomeSalario+' = '+sSalario+
                   ' WHERE  IDPESSJUR   = '+qryParticipantes.FieldByName('IdPessJur').AsString+
                   ' AND    IDPLANOPREV = '+qryParticipantes.FieldByName('IdPlanoPrev').AsString+
                   ' AND    IDPESSOA    = '+qryParticipantes.FieldByName('IdPessoa').AsString+
                   ' AND    SEQPROPOSTA = '+qryParticipantes.FieldByName('SeqProposta').AsString);
           try
              ExecSQL;
           except
              on E:EDBEngineError do
              begin
                 dtmBaseDados.dbBaseDados.Rollback;
                 MostrarErro(E);
                 Exit;
              end;
           end;

        end; // with
        qryParticipantes.Next;
     end; //while
  end; // for

  Try
    If Not Sistema.GravaLogOperacoes('Atualização de Salários de Participantes') Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  if MsgDlg('A Atualização de Salários foi concluída com sucesso.'+#13+
            'Deseja efetivar a operação ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes
  then begin
     dtmBaseDados.dbBaseDados.Commit;
     MsgDlg('Operação EFETIVADA.','Informação',mtInformation,[mbOk, mbHelp],0);
  end
  else begin
     dtmBaseDados.dbBaseDados.Rollback;
     MsgDlg('Operação CANCELADA.','Informação',mtInformation,[mbOk, mbHelp],0);
  end;
end;

procedure TfrmAtualizaSalario.Button1Click(Sender: TObject);
VAR  T : TEXTFILE;
     I : INTEGER;
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  //ASSIGNFILE(T,'c:\listapessoacm.txt');
  ASSIGNFILE(T, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\listapessoacm.txt');

  rewrite(t);
  qry.close;
  qry.sql.clear;
  qry.sql.add(' SELECT EL.MATRICULA, EL.IDPESSOA, EL.IDPESSJUR '+
              ' FROM ELEGPATRO EL  '+
              ' ORDER BY EL.MATRICULA ');
  QRY.OPEN;
  I := 0;
  WHILE NOT QRY.EOF DO
  BEGIN
     WRITELN(T, qry.fieldbyname('matricula').ASSTRING+' '+
                qry.fieldbyname('idpessoa').ASSTRING+' '+
                qry.fieldbyname('idpessjur').ASSTRING);

     QRY.NEXT;
     INC(I);
     Button1.CAPTION := INTTOSTR(I);
     APPLICATION.ProcessMessages;
  END;

  QRY.CLOSE;
  CLOSEFILE (T);
end;



end.