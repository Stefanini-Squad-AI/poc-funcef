// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : Darivaldo Alencar
// Data        : 08/04/2016
// Pendência   : SOL.253577/17989 ppm.1198155
// Rotina      : FLGDEFICIT,cmcadastro
// Descricao   : Inclusão de checkbox cbxFLGDEFICIT para controlar campo
//               FLGDEFICIT na tabela RESERVAXPLANO;
//               Corrigido insert RESERVAPART em massa ao invés de inserrir uma linha por vez
//               Corrigido erro no delete RESERVAXPLANO
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 10/07/2007
// Pendência   : 25830
// Rotina      : FormCreate
// Descricao   : Verifica se o form dtmAPrev foi criado ou não
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/02/2006
// Pendência   : 23876
// Rotina      : qry
// Descricao   : Inclusão dos campos IDPLANOPREV, IDTIPORESERVA no UpdateSql
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : AtuReserva
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 02/10/2006
// Rotina      : - (qry + upd)
// Pendencia   : 18949
// Alteração   : Ajuste visual no form + gravação do novo campo FlgRegressiva
//               na ReservaXPlano ("Sujeita à aplicação de Tabela Regressiva de IRRF")
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/12/2005
// Rotina      : CmeCadastroConfirma
// Pendencia   : 20731
// Alteração   : Correção no LogTotalPrev
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/06/2005
// Rotina      : dbedCodHierarquiaExit e TamanhoNivel
// Pendencia   : 18725
// Alteração   : Criação de função com o objetivo de criticar o tamanho do cód.
//               hierarquia digitado com o tamanho da máscara informada no parâmetro
//               do sistema
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 31/05/2005
// Rotina      : CmeCadastroDelete
// Pendencia   : 17971
// Alteração   : A fim de evitar um erro no componente CMTREE que ocorre ao deletar
//               o último item da árvore de reservas, monta-se de novo ao final
//               da rotina.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 29/03/2005
// Rotina      : AtuReserva
// Alteração   : não estava gravando os registros inseridos em cached na reservapart
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 29/12/2004
// Rotina      : AtuReserva
// Pendencia   : 18284
// Alteração   : Quando a reserva for coletiva associa a todas as patros que
//               tenham o plano ativo
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/11/2004
// Pendencia   : 18150
// Rotina      : cmtvTipoReservaChanging
// Alteração   : Habilita o botão ALTERAR e EXCLUIR quando se navega pela árvore
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/11/2004
// Pendencia   : 18159
// Rotina      : qryAfterScroll
// Alteração   : Só muda o valor da variável bAutorizaApaga quando não for uma
//               operação de DELETE (apagar registro).
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Alterações :
//
// --- *** ---
//  Autor    : Augusto
//  Data     : 14/04/2002
//  Descrição: Não permite alterar Tipo de Controle de uma Reserva.
// --- *** ---
//  Autor    : Carlos Gleyber Macedo de Mesquita
//  Data     : 04/04/2002
//  Descrição: Atualizarção da tabela de associação (RESERVAPART) quando incluir
//             novas reservas
// --- *** ---
//------------------------------------------------------------------------------
unit FCadReservaXPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, DBTables, Wwquery,
  ComCtrls, CMTree, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,DBaseDados,
  CmEventosCadastro, wwDialog, ImgList, FCadastro, MontaSelect {$IFNDEF VERSAO0505 },
  UCMTypes, Wwdotdot, Wwdbcomb {$ENDIF} ;


type
   TfrmCadReservaXPlano = class(TfrmCadastroCS)
      qryMoeda: TwwQuery;
      pnlCadastro: TPanel;
      Label23: TLabel;
      Label8: TLabel;
      Label2: TLabel;
      dblkcmbIndiceReajuste: TwwDBLookupCombo;
      dblkcmbRegraCorrecao: TwwDBLookupCombo;
      qryAux: TwwQuery;
      qryMoedaCorr: TwwQuery;
      Label4: TLabel;
      dbedReserva: TDBEdit;
      dbrgrpFlgColetiva: TDBRadioGroup;
      dbrgrpFlgControle: TDBRadioGroup;
      qryRPart: TwwQuery;
      Label3: TLabel;
      dbedIdTipoReserva: TDBEdit;
      rgTitularidade: TRadioGroup;
      dbedCodHierarquia: TwwDBEdit;
      qryANALITICOSINTETI: TStringField;
      qryCODHIERARQUIA: TStringField;
      qryFLGCOLETIVA: TFloatField;
      qryFLGCONTROLE: TFloatField;
      qryFLGDESCIRRF: TFloatField;
      qryFLGTITULARCOLET: TStringField;
      qryFLGTRANSFERENCIA: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDREGRAPAGTORESE: TFloatField;
      qryIDTIPORESERVA: TFloatField;
      qryINDICEREAJUSTE: TFloatField;
      qryNOME: TStringField;
      qryFLGTIPORESERVA: TFloatField;
      qryINDICECORRECAO: TFloatField;
      dbrgrpReservaMatematica: TDBRadioGroup;
      dbrgrpReservaTransf: TDBRadioGroup;
      dbrgrpDescIRRF: TDBRadioGroup;
      lblRegra: TLabel;
      dblkpcmbRegra: TwwDBLookupCombo;
      qryRegra: TwwQuery;
      dsRPart: TDataSource;
      updRPart: TUpdateSQL;
      qryRPartIDTIPORESERVA: TFloatField;
      qryRPartIDPLANOPREV: TFloatField;
      qryRPartIDPESSOA: TFloatField;
      qryRPartIDPESSJUR: TFloatField;
      qryRPartDATAREFERENCIASA: TDateTimeField;
      qryRPartSEQPROPOSTA: TFloatField;
      qryRPartVALORRESERVA: TFloatField;
      qryRPartPERCENTUALSAQUE: TFloatField;
      qryRPartFLGATIVO: TFloatField;
      qryRPartDATADESATIV: TDateTimeField;
      dbcModoAtualiza: TwwDBComboBox;
      Label1: TLabel;
      qryFLGMODATUALIZACAO: TFloatField;
    pnlTitulo: TPanel;
      cmtvTipoReserva: TCMTreeView;
    //Darivaldo Alencar - SOL 253577.17989_1198155 - inicio
    //DBCheckBox1: TDBCheckBox;  
    cbxFLGREGRESSIVA: TDBCheckBox;
    qryFLGREGRESSIVA: TFloatField;

      qryRPartIDPARTICIPANTE: TFloatField;
    cbxFLGDEFICIT: TDBCheckBox;
    qryFLGDEFICIT: TFloatField;
    //Darivaldo Alencar - SOL 253577.17989_1198155 - fim

      procedure FormShow(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure dsStateChange(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure cmtvTipoReservaChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
      procedure dbrgrpFlgColetivaClick(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure qryBeforePost(DataSet: TDataSet);
      procedure qryAfterScroll(DataSet: TDataSet);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbtnInserirClick(Sender: TObject);
      procedure dbedCodHierarquiaExit(Sender: TObject);
      procedure dbrgrpReservaMatematicaClick(Sender: TObject);
      function  AtuReserva : boolean;
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure sbtnAlterarClick(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure FormCreate(Sender: TObject);


   private  // Private declarations }

      sControleColetAnt,
      IdTpReserva    : string;
      bArvoreEnabled : boolean;
      bAutorizaApaga : boolean;

      procedure MontaTitularidade;
      procedure AcertaAnaliticoSintetico;
      function TamanhoNivel(psCodigo: String): Boolean; 


   public   // Public declarations }

      sIndiceReaj : String;

   end;



var
  frmCadReservaXPlano: TfrmCadReservaXPlano;


implementation

uses UMensErro, UMascaras, UAdmPrev, USistema, UDataBase, FTelaAut,
  fAguarde, DAPrev, UModulo;

{$R *.DFM}

procedure TfrmCadReservaXPlano.FormShow(Sender: TObject);
begin
  inherited;
  qryRPart.Prepare;
end;

procedure TfrmCadReservaXPlano.AcertaAnaliticoSintetico;
var bEstavaEmTransacao : boolean;
begin

  // Percorrer todas as reservas verificando se alguma delas possui reserva filha,
  // para colocá-la como sintética
  with qry do
  begin
     if dtmBaseDados.dbBaseDados.InTransaction
     then bEstavaEmTransacao := True
     else begin
        dtmBaseDados.dbBaseDados.StartTransaction;
        bEstavaEmTransacao := False;
     end;

     DisableControls;
     //First;
     qry.Close;
     qry.ParamByName('IDPLANOPREV').AsInteger   := StrToInt(sIdPlano);
     qry.Open;

     while not Eof do
     begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO '+
                       ' WHERE  IDPLANOPREV   = '+sIdPlano+
                       ' AND    CODHIERARQUIA LIKE '''+FieldByName('CODHIERARQUIA').AsString+'%'''+
                       ' AND    CODHIERARQUIA <>   '''+FieldByName('CODHIERARQUIA').AsString+'''');
        qryAux.Open;

        if not qryAux.IsEmpty
        then begin
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' UPDATE RESERVAXPLANO SET ANALITICOSINTETI = ''S''  '+
                          ' WHERE  IDPLANOPREV   = '+sIdPlano+
                          ' AND    IDTIPORESERVA = '+qry.FieldByName('IDTIPORESERVA').AsString);
           qryAux.ExecSQL;
        end
        else begin
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' UPDATE RESERVAXPLANO SET ANALITICOSINTETI = ''A''  '+
                          ' WHERE  IDPLANOPREV   = '+sIdPlano+
                          ' AND    IDTIPORESERVA = '+qry.FieldByName('IDTIPORESERVA').AsString);
           qryAux.ExecSQL;
        end;
        Next;
     end;
     if not bEstavaEmTransacao
     then dtmBaseDados.dbBaseDados.Commit;
     qry.Close;
     qry.ParamByName('IDPLANOPREV').AsInteger   := StrToInt(sIdPlano);
     qry.Open;

     qry.FieldByName('CODHIERARQUIA').EditMask := sMascTpReserva + ';0;_';
     EnableControls;
  end;
end;

procedure TfrmCadReservaXPlano.FormActivate(Sender: TObject);
begin

  frmAguarde.Apaga;
  pnlTitulo.Caption := ' Reservas do Plano: ' + sNomePlano;
  MontaSelect.Filtro.Add(' IDPLANOPREV = '+sIdPlano);


  dbrgrpFlgControle.ItemIndex       := 0;
  dbrgrpFlgColetiva.ItemIndex       := 1;
  rgTitularidade.ItemIndex          := 0;
  dbrgrpReservaMatematica.ItemIndex := 0;
  dbrgrpReservaTransf.ItemIndex     := 0;
  dbrgrpDescIRRF.ItemIndex          := 0;

  MontaTitularidade;

  qryMoeda.Close;      qryMoeda.Open;
  qryMoedaCorr.Close;  qryMoedaCorr.Open;
  qryRegra.Close;      qryRegra.Open;

  if not qry.Active
  then begin
     qry.Close;
     qry.ParamByName('IDPLANOPREV').AsInteger   := StrToInt(sIdPlano);
     qry.Open;

     qry.FieldByName('CODHIERARQUIA').EditMask := sMascTpReserva + ';0;_';
  end;

  CmeCadastro.Operacao := opIdle;

  AcertaAnaliticoSintetico;

  cmtvTipoReserva.Mascara  := sMascTpReserva;
  cmtvTipoReserva.MontaArvore;

  cmtvTipoReserva.Enabled := True;




  if dbrgrpReservaMatematica.ItemIndex = 0
  then begin // nao
     lblRegra.Visible      := False;
     dblkpcmbRegra.Visible := False;
  end
  else begin // sim
     lblRegra.Visible      := True;
     dblkpcmbRegra.Visible := True;
  end;


  qryRPart.Close;
  qryRPart.ParamByName('IDPLANOPREV').AsInteger := StrToInt(sIdPlano);
  qryRPart.Open;

  inherited;
end;

procedure TfrmCadReservaXPlano.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbrgrpFlgControle.ItemIndex       := 0;
  dbrgrpFlgColetiva.ItemIndex       := 1;
  rgTitularidade.ItemIndex          := 0;
  dbrgrpReservaMatematica.ItemIndex := 0;
  dbrgrpReservaTransf.ItemIndex     := 0;
  dbrgrpDescIRRF.ItemIndex          := 0;

  if dbrgrpReservaMatematica.ItemIndex = 0
  then begin // nao
     lblRegra.Visible      := False;
     dblkpcmbRegra.Visible := False;
  end
  else begin // sim
     lblRegra.Visible      := True;
     dblkpcmbRegra.Visible := True;
  end;

  dbedCodHierarquia.Enabled   := True;

  MontaTitularidade;
end;

procedure TfrmCadReservaXPlano.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  sControleColetAnt         := qry.FieldByName('FLGCOLETIVA').AsString;
  dbedCodHierarquia.Enabled := False;
end;

procedure TfrmCadReservaXPlano.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;

  qry.Locate('IDTIPORESERVA', StrToInt(MontaSelect.ValoresChave[1]),[]);

end;

procedure TfrmCadReservaXPlano.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;

  If CmeCadastro.Operacao <> opApagar
   Then bAutorizaApaga := False;


  MontaTitularidade;

  if qry.FieldByName('FLGTITULARCOLET').AsString = 'P' then // Patrocinadora
     rgTitularidade.ItemIndex := 0
  else
  if qry.FieldByName('FLGTITULARCOLET').AsString = 'F' then // Fundação
     rgTitularidade.ItemIndex := 1
  else
  if qry.FieldByName('FLGTITULARCOLET').AsString = 'T' then // Participante
     rgTitularidade.ItemIndex := 2;

  dbrgrpFlgColetiva.Enabled   := True;

  if qry.FieldByName('FLGTIPORESERVA').AsInteger = 0
  then begin // nao
     lblRegra.Visible      := False;
     dblkpcmbRegra.Visible := False;
  end
  else begin // sim
     lblRegra.Visible      := True;
     dblkpcmbRegra.Visible := True;
  end;

end;

procedure TfrmCadReservaXPlano.qryBeforePost(DataSet: TDataSet);
begin

  // Verifica Campos de Preenchimento Obrigatório
  if Trim(dbedCodHierarquia.Text) = ''
  then begin
     MsgDlg('Código de Hierarquia não preenchido','Erro',mtError,[mbOk,mbHelp],0);
     dbedCodHierarquia.SetFocus;
     Abort;
  end;

  if Trim(dbedReserva.Text) = ''
  then begin
     MsgDlg('Reserva não preenchida','Erro',mtError,[mbOk,mbHelp],0);
     dbedReserva.SetFocus;
     Abort;
  end;
  // Verifica Campos de Preenchimento Obrigatório

  if qry.State = dsInsert
  then begin
     qry.FieldByName('IDTIPORESERVA').AsInteger   := LeUltRegistro(nil,'RESERVAXPLANO');
     qry.FieldByName('IDPLANOPREV').AsString      := sIdPlano;
     qry.FieldByName('ANALITICOSINTETI').AsString := 'A';
     IdTpReserva                                  := qry.FieldByName('IDTIPORESERVA').AsString;
  end;



  //verifica se o índice e reajuste foi alterado
  //caso sim, o índice antigo deve ser inserido no histórico de índices
  //para casos de alimentação retroativa
  if (qry.State = dsEdit) and
     (sIndiceReaj <> qry.fieldbyname('INDICEREAJUSTE').AsString ) then
  begin
     dtmAPrev.qryAux.Close;
     dtmAPrev.qryAux.sql.Text :=  ' INSERT INTO HISTINDICERESERVA(IDPLANOPREV , IDTIPORESERVA , INDICEREAJUSTE, DATAFIM) '+
                               ' VALUES ( '+qry.FieldByName('IDPLANOPREV').AsString+' , '+
                               ' '+qry.FieldByName('IDTIPORESERVA').AsString+' , '+
                               ' '+sIndiceReaj+' , '+
                               ' TO_DATE(TO_CHAR(SYSDATE -1,''DD/MM/YYYY''),''DD/MM/YYYY'') ) ';
     try
        dtmAPrev.qryAux.ExecSql;
     except
        {caso o usuário se confunda e altere mais de uma vez
        este try faz com que o erro não apareça na tela.}
     end;
  end;





  //Alteração para DB2
  qry.FieldByName('CODHIERARQUIA').AsString := dbedCodHierarquia.Text;

  case rgTitularidade.ItemIndex of
       0 : qry.FieldByName('FLGTITULARCOLET').AsString := 'P'; // Patrocinadora
       1 : qry.FieldByName('FLGTITULARCOLET').AsString := 'F'; // Fundação
       2 : qry.FieldByName('FLGTITULARCOLET').AsString := 'T'; // Participante
  end;

  inherited;
end;

procedure TfrmCadReservaXPlano.dsStateChange(Sender: TObject);
begin
  inherited;

 if qry.State in [dsInsert]
  then begin
     bArvoreEnabled := False;
  end else
  if qry.State in [dsEdit]
  then begin
     bArvoreEnabled := False;
  end
  else if qry.State in [dsBrowse] then
  begin
     bArvoreEnabled := True;
  end;

end;


procedure TfrmCadReservaXPlano.bbtnCancelarClick(Sender: TObject);
var sql:string;
begin
  inherited;
  dbrgrpFlgColetiva.Enabled := True;
end;

procedure TfrmCadReservaXPlano.cmtvTipoReservaChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  inherited;
  if bArvoreEnabled = False
  then AllowChange := False
  else AllowChange := True;

  sbtnAlterar.Enabled := bArvoreEnabled;
  sbtnApagar.Enabled  := bArvoreEnabled;

end;

procedure TfrmCadReservaXPlano.dbrgrpFlgColetivaClick(Sender: TObject);
begin
  inherited;
  MontaTitularidade;
end;

procedure TfrmCadReservaXPlano.MontaTitularidade;
begin
  rgTitularidade.Items.Clear;

  rgTitularidade.Items.Add('Patrocinadora');
  rgTitularidade.Items.Add('Fundação');

  if dbrgrpFlgColetiva.ItemIndex = 1
  then rgTitularidade.Items.Add('Participante');

  rgTitularidade.ItemIndex := 0;
end;


procedure TfrmCadReservaXPlano.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled    := True;
  pnlCadastro.Enabled := (qry.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadReservaXPlano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

  inherited;
end;

procedure TfrmCadReservaXPlano.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbedCodHierarquia.SetFocus;

  dbrgrpFlgColetiva.Enabled := True;

end;

procedure TfrmCadReservaXPlano.dbedCodHierarquiaExit(Sender: TObject);
begin
  inherited;
  If (dbedCodHierarquia.Text <> '') And
     (Not TamanhoNivel(dbedCodHierarquia.Text))
   Then Begin
     MsgDlg('Cod.Hierarquia digitado não está do tamanho correto da máscara do nível.'+#13+
            'Digite com o tamanho de caracteres correto.','Erro', mtError, [mbOk],0);
     dbedCodHierarquia.SetFocus;
     Exit;
   End;




  if dbedCodHierarquia.Text <> '' Then
      if qry.State in [dsInsert] Then Begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO '+
                        ' WHERE  IDPLANOPREV   = ' + sIdPlano +
                        ' AND    CODHIERARQUIA = ' + QuotedStr(dbedCodHierarquia.Text));
         qryAux.Open;
         if not qryAux.IsEmpty then begin
           MsgDlg('Código de Hierarquia já cadastrado','Erro',mtError,[mbOk,mbHelp],0);
           dbedCodHierarquia.SetFocus;
           exit;
         end;
      end;


end;

procedure TfrmCadReservaXPlano.dbrgrpReservaMatematicaClick(
  Sender: TObject);
begin
  inherited;
  if dbrgrpReservaMatematica.ItemIndex = 0
  then begin // nao
     lblRegra.Visible      := False;
     dblkpcmbRegra.Visible := False;
  end
  else begin // sim
     lblRegra.Visible      := True;
     dblkpcmbRegra.Visible := True;
  end;
end;


function TfrmCadReservaXPlano.AtuReserva : boolean;
Var
 sSql  :  String;
begin
  inherited;
  Result := False;

  if (CmeCadastro.Operacao = opAlterar) and
     (sControleColetAnt <> qry.FieldByName('FLGCOLETIVA').AsString)
  then begin
     if sControleColetAnt = '1'
     then begin // o controle era coletivo e passou a ser individual

        // Inserir tipo de reserva por participante
        sSql := ' SELECT DISTINCT R.IDTIPORESERVA,R.IDPLANOPREV,PP.IDPESSOA, '+
                '        R.IDPESSJUR,R.DATAREFERENCIASA,PP.SEQPROPOSTA, '+
                '        R.VALORRESERVA, '+
                '        R.PERCENTUALSAQUE, '+
                '        R.FLGATIVO,R.DATADESATIV '+
                ' FROM   RESERVAPART R, PARTPREVPLAN PP'+
                ' WHERE  R.IDTIPORESERVA = '+qry.FieldByName('IDTIPORESERVA').AsString+' AND '+
                '        PP.IDPESSJUR    = R.IDPESSJUR AND '+
                '        PP.IDPESSOA     = R.IDPESSOA  AND '+
                '        PP.IDPLANOPREV  = R.IDPLANOPREV ';
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        qryAux.Open;

        While not qryAux.Eof do
         Begin
          qryRPart.Insert;

          qryRPartIDTIPORESERVA.AsInteger    := qryAux.FieldByName('IDTIPORESERVA').AsInteger;
          qryRPartIDPLANOPREV.AsInteger      := qryAux.FieldByName('IDPLANOPREV').AsInteger;
          qryRPartIDPESSOA.AsInteger         := qryAux.FieldByName('IDPESSOA').AsInteger;
          qryRPartIDPESSJUR.AsInteger        := qryAux.FieldByName('IDPESSJUR').AsInteger;
          qryRPartDATAREFERENCIASA.AsDateTime:= qryAux.FieldByName('DATAREFERENCIASA').AsDateTime;
          qryRPartSEQPROPOSTA.AsInteger      := qryAux.FieldByName('SEQPROPOSTA').AsInteger;
          qryRPartVALORRESERVA.AsString      := qryAux.FieldByName('VALORRESERVA').AsString;
          qryRPartPERCENTUALSAQUE.AsString   := qryAux.FieldByName('PERCENTUALSAQUE').AsString;
          qryRPartFLGATIVO.AsString          := qryAux.FieldByName('FLGATIVO').AsString;
          qryRPartDATADESATIV.AsDateTime     := qryAux.FieldByName('DATADESATIV').AsDateTime;

          qryRPartIDPARTICIPANTE.AsInteger   := qryAux.FieldByName('IDPESSOA').AsInteger; 

          qryRPart.Post;

          qryAux.Next;
         End;

        // Apagar tipo de reserva por patrocinadora
        qryRPart.Filtered := False;

        qryRPart.Filtered := False;
        qryRPart.Filter   := 'IDTIPORESERVA = '+qry.FieldByName('IDTIPORESERVA').AsString;
        qryRPart.Filtered := True;
        qryRPart.First;

        While not qryRPart.Eof do
         Begin
          If qryRPartIDPESSJUR.AsInteger = qryRPartIDPESSOA.AsInteger Then
           Begin
            qryRPart.Edit;
            qryRPartFLGATIVO.AsInteger := 0;
            qryRPartDATADESATIV.AsDateTime := Date;
            qryRPart.Post;
           End;
          qryRPart.Next;
         End;

        qryRPart.First;

        While not qryRPart.Eof do
         If qryRPartIDPESSJUR.AsInteger = qryRPartIDPESSOA.AsInteger
          Then qryRPart.Delete
          Else qryRPart.Next;

        qryRPart.ApplyUpdates;
        qryRPart.Filtered := False;
     end
     else begin // o controle era individual e passou a ser coletivo

        // Inserir tipo de reserva por participante

        sSql := ' SELECT DISTINCT R.IDTIPORESERVA,R.IDPLANOPREV,R.IDPESSJUR, '+
                '        R.IDPESSJUR,R.DATAREFERENCIASA,1, '+
                '        R.VALORRESERVA, '+
                '        R.PERCENTUALSAQUE, '+
                '        R.FLGATIVO,R.DATADESATIV '+
                ' FROM   RESERVAPART R '+
                ' WHERE  R.IDTIPORESERVA = '+qry.FieldByName('IDTIPORESERVA').AsString;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        qryAux.Open;

        While not qryAux.Eof do
         Begin
          qryRPart.Insert;

          qryRPartIDTIPORESERVA.AsInteger    := qryAux.FieldByName('IDTIPORESERVA').AsInteger;
          qryRPartIDPLANOPREV.AsInteger      := qryAux.FieldByName('IDPLANOPREV').AsInteger;
          qryRPartIDPESSOA.AsInteger         := qryAux.FieldByName('IDPESSJUR').AsInteger;
          qryRPartIDPESSJUR.AsInteger        := qryAux.FieldByName('IDPESSJUR').AsInteger;
          qryRPartDATAREFERENCIASA.AsDateTime:= qryAux.FieldByName('DATAREFERENCIASA').AsDateTime;
          qryRPartSEQPROPOSTA.AsInteger      := 1;
          qryRPartVALORRESERVA.AsString      := qryAux.FieldByName('VALORRESERVA').AsString;
          qryRPartPERCENTUALSAQUE.AsString   := qryAux.FieldByName('PERCENTUALSAQUE').AsString;
          qryRPartFLGATIVO.AsString          := qryAux.FieldByName('FLGATIVO').AsString;
          qryRPartDATADESATIV.AsDateTime     := qryAux.FieldByName('DATADESATIV').AsDateTime;

          qryRPartIDPARTICIPANTE.AsInteger   := qryAux.FieldByName('IDPESSJUR').AsInteger; 

          qryRPart.Post;

          qryAux.Next;
         End;

        // Apagar tipo de reserva por patrocinadora

        qryRPart.Filtered := False;
        qryRPart.Filter   := 'IDTIPORESERVA = '+qry.FieldByName('IDTIPORESERVA').AsString;
        qryRPart.Filtered := True;
        qryRPart.First;

        While not qryRPart.Eof do
         Begin
          If qryRPartIDPESSJUR.AsInteger <> qryRPartIDPESSOA.AsInteger Then
           Begin
            qryRPart.Edit;
            qryRPartFLGATIVO.AsInteger     := 0;
            qryRPartDATADESATIV.AsDateTime := Date;
            qryRPart.Post;
           End;
          qryRPart.Next;
         End;

        qryRPart.First;
        While not qryRPart.Eof do
         If qryRPartIDPESSJUR.AsInteger <> qryRPartIDPESSOA.AsInteger
          Then qryRPart.Delete
          Else qryRPart.Next;

        qryRPart.Filtered := False;
     end;
  end;

  if CmeCadastro.Operacao = opInserir
  Then Begin
     If qry.fieldbyname('FLGCOLETIVA').asstring = '1'
      Then Begin  // Reserva coletiva, associá-la a fundacao
       // Quando a reserva for coletiva associa a todas as patros que tenham o plano ativo
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add('SELECT IDPESSJUR');
       qryAux.SQL.Add('FROM PLANPREVPATRO');
       qryAux.SQL.Add('WHERE FLGATIVO = 1');
       qryAux.SQL.Add('  AND IDPLANOPREV = '+sIdPlano);
       qryAux.Open;

       While Not qryAux.Eof Do
        Begin
          qryRPart.Insert;
          qryRPartIDPLANOPREV.AsInteger   := StrToInt(sIdPlano);
          qryRPartIDPESSJUR.AsInteger     := iIdFundacao;
          qryRPartIDTIPORESERVA.AsInteger := qry.FieldByName('IDTIPORESERVA').AsInteger;
          qryRPartIDPESSOA.AsInteger      := qryAux.FieldByName('IDPESSJUR').AsInteger;

          qryRPartIDPARTICIPANTE.AsInteger   := qryAux.FieldByName('IDPESSJUR').AsInteger;

          qryRPartSEQPROPOSTA.AsInteger   := 1; 
          qryRPartVALORRESERVA.AsInteger  := 0;

          qryRPart.Post;

          qryAux.Next;
        End;
       

    End
    else
        begin // Reserva individual - Gleyber
        //Darivaldo - SOL 253577.17989_1198155 --inicio
        {sSQL := ' SELECT IDPLANOPREV, IDPESSJUR, IDPESSOA, SEQPROPOSTA             '+
                ' FROM   PARTPREVPLAN                                              '+
                ' WHERE  IDPLANOPREV   = '+qry.ParamByName('IDPLANOPREV').AsString  +
                ' AND    FLGDESATIVADO = 0                                         '+
                ' AND    DATACANCELAMENTO IS NULL                                  ';

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        qryAux.Open;

        while not qryAux.Eof do
        begin
          qryRPart.Insert;
          qryRPartIDPLANOPREV.AsInteger   := qryAux.FieldByName('IDPLANOPREV').AsInteger;
          qryRPartIDPESSJUR.AsInteger     := qryAux.FieldByName('IDPESSJUR').AsInteger;
          qryRPartIDTIPORESERVA.AsInteger := qry.FieldByName('IDTIPORESERVA').AsInteger;
          qryRPartIDPESSOA.AsInteger      := qryAux.FieldByName('IDPESSOA').AsInteger;
          qryRPartSEQPROPOSTA.AsInteger   := qryAux.FieldByName('SEQPROPOSTA').AsInteger;
          qryRPartIDPARTICIPANTE.AsInteger   :=  qryAux.FieldByName('IDPESSOA').AsInteger;

          qryRPartVALORRESERVA.AsInteger  := 0;

          qryRPart.Post;

          qryAux.Next;
        end; }
        sSQL := ' insert into RESERVAPART(IDPLANOPREV,IDPESSJUR,IDTIPORESERVA,IDPESSOA,SEQPROPOSTA,IDPARTICIPANTE,VALORRESERVA)'+
                ' SELECT IDPLANOPREV, IDPESSJUR,'+qry.FieldByName('IDTIPORESERVA').AsString+',IDPESSOA, SEQPROPOSTA, IDPESSOA,0'+
                ' FROM   PARTPREVPLAN  WHERE  IDPLANOPREV   = '+qry.FieldByName('IDPLANOPREV').AsString +
                ' AND    FLGDESATIVADO = 0 AND    DATACANCELAMENTO IS NULL';
        qryRPart.close;
        qryRPart.sql.clear;
        qryRPart.sql.add(sSQL);
        qryRPart.ExecSQL;
        //Darivaldo - SOL 253577.17989_1198155 --fim
    end;
  end;

  if qryRPart.updatespending then qryRPart.ApplyUpdates;

  Result := True;
end;

procedure TfrmCadReservaXPlano.CmeCadastroConfirma(Sender: TObject);
begin
  if (CmeCadastro.Operacao = opApagar)
  then begin
     if not bAutorizaApaga then Abort;
     dtmBaseDados.dbBaseDados.StartTransaction;
     try
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' DELETE HISTMOVRESERVA '+
                   ' WHERE  IDPLANOPREV   = '+OraNumero(qry.FieldByName('IDPLANOPREV').AsString)+
                   ' AND    IDTIPORESERVA = '+OraNumero(IdTpReserva));
           ExecSQL;

           Close;
           SQL.Clear;
           SQL.Add(' DELETE RESERVAPART         '+
                   ' WHERE  IDPLANOPREV   = '+OraNumero(qry.FieldByName('IDPLANOPREV').AsString)+
                   ' AND    IDTIPORESERVA = '+OraNumero(IdTpReserva));
           ExecSQL;

           GravaLogTotalPrev('Cad. Reserva x Plano - Plano:'+qry.FieldByName('IDPLANOPREV').AsString+
                                    '- Reserva:'+OraNumero(IdTpReserva)+' - Exclusão'); 
        end;
        dtmBaseDados.dbBaseDados.Commit;
     except
        dtmBaseDados.dbBaseDados.RollBack;
        Abort;
     end;
  end;

  inherited;

  AtuReserva;

  Try
    If Not Sistema.GravaLogOperacoes(Self.Caption) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

end;

procedure TfrmCadReservaXPlano.sbtnAlterarClick(Sender: TObject);
begin
  if not qry.isempty then
     sIndiceReaj := qry.fieldbyname('INDICEREAJUSTE').AsString;

  inherited;

  dbrgrpFlgColetiva.Enabled := False;
end;

procedure TfrmCadReservaXPlano.CmeCadastroDelete(Sender: TObject);
begin
  // Verificar se existem reservas associadas
  IdTpReserva := qry.FieldByName('IDTIPORESERVA').AsString;
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(*) AS TOTAL '+
             ' FROM   RESERVAPART         '+
             ' WHERE  IDPLANOPREV   = '+OraNumero(qry.FieldByName('IDPLANOPREV').AsString)+
             ' AND    IDTIPORESERVA = '+OraNumero(qry.FieldByName('IDTIPORESERVA').AsString));
     Open;
     if (not IsEmpty) and (FieldByName('TOTAL').AsInteger > 0)
     then begin
        if MsgDlg('Existem '+FieldByName('TOTAL').AsString+' associações relacionadas a reserva '+
                  OraNumero(qry.FieldByName('CODHIERARQUIA').AsString)+#13+#13+
                  'Deseja realmente excluir essa reserva ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
        then bAutorizaApaga := False
        else bAutorizaApaga := True;
     end
     else bAutorizaApaga := True;
     Close;

     if not bAutorizaApaga then Abort;
  end;


  //  Darivaldo Alencar --SOL.253577/17989 ppm.1198155
  //  ao limpar a arvore antes do delete, o valor de código de hierarquia era atualizado com maior valor da arvore
  //  cmtvTipoReserva.Items.Clear;

  inherited;
   cmtvTipoReserva.Items.Clear;//Darivaldo Alencar --SOL.253577/17989 ppm.1198155
  
  FormActivate(Self);


end;


function TfrmCadReservaXPlano.TamanhoNivel(psCodigo: String): Boolean;
Var
 i,
 iTamMascara,
 iTamCodigo  : Integer;
 sCodigo     : String;
begin
  iTamCodigo  := Length(Trim(psCodigo));
  iTamMascara := Length(Trim(sMascTpReserva));
  sCodigo     := sMascTpReserva;
  i := Pos('.', sCodigo)-1;
  While i <= Length(Trim(sMascTpReserva)) do
   Begin
    Result := (i = iTamCodigo);

    If Result
     Then Exit;

    If (Copy(psCodigo, i+1,1) <> '.') And
       (Copy(psCodigo, i+1,1) <> '')
     Then psCodigo := Copy(psCodigo, 1, i)+'.'+Copy(psCodigo, i+1, iTamCodigo)
     Else If Length(Trim(psCodigo)) = Length(Trim(sMascTpReserva))
           Then Begin
             Result := True;
             Exit;
           End
           Else Exit;

    iTamCodigo := Length(Trim(psCodigo));

    Delete(sCodigo, 1, Pos('.', sCodigo));
    i := i + Pos('.', sCodigo);
   End;
end;


procedure TfrmCadReservaXPlano.FormCreate(Sender: TObject);
begin
  inherited;
  If dtmAPrev = Nil Then
    Application.CreateForm(TdtmAPrev, dtmAPrev);
end;

end.
