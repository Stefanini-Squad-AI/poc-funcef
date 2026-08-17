// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 03/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Augusto
// Pendência : 19191
// Data      : 16/05/2005
// Alteração : Acerto para atualiza DATAPREVISTA e FLGDATAPREVISTA
// -----------------------------------------------------------------------------
// Rotina    : Acerto de qry e qryAux, FORMSHOW
// Autor(a)  : Gleyber
// Pendência : 19031
// Data      : 13/04/2005
// Alteração : Retirado os fields da qry; Alterado a propriedade CachedUpdate da
//             qryAux. Colocado o campo ULTMESPREPARO na string SSQL
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : Criação de filtro
// Autor(a)  : Gleyber
// Data      : 16/04/2003
// Alteração : Retirada do IDBENEFICIO <> 99
// -----------------------------------------------------------------------------
// Rotina    : Criação de filtro
// Autor(a)  : Gleyber
// Data      : 25/10/2002
// Alteração : Criação de vários filtros
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Carlos Guedes
// Data      : 21/10/2002
// Alteração : Acertando nomes de campos.
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------
unit FSuspendeBeneficio;

//	-------------------------------------------------------------------------------------------------
//
//	Suspensão de Benefícios
//
//	Autor          :  André Pontes
//	Data de Início :  10/08/1999
//	Data de Término:  10/08/1999
//
//	Modificações	:  
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, ComCtrls, wwdblook, wwdbdatetimepicker, Wwdbdlg;

type
  TfrmSuspendeBeneficio = class(TfrmSairAjuda)
    DBgrdBeneficio: TwwDBGrid;
    pnlTitulo: TPanel;
    btnSuspende: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qry: TwwQuery;
    ds: TwwDataSource;
    upd: TUpdateSQL;
    qryAtualiza: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField8: TStringField;
    FloatField10: TFloatField;
    StringField9: TStringField;
    DBgrdBeneficioIButton: TwwIButton;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    qryBenef: TwwQuery;
    GroupBox2: TGroupBox;
    edtNrInscricao: TEdit;
    GroupBox3: TGroupBox;
    edtMatricula: TEdit;
    GroupBox4: TGroupBox;
    EdtNome: TEdit;
    cbOpcao: TComboBox;
    bbtnProcurar: TBitBtn;
    GroupBox5: TGroupBox;
    dbDataLimite: TwwDBDateTimePicker;
    dblkBeneficio: TwwDBLookupCombo;
    qryAux: TwwQuery;

    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBgrdBeneficioDblClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);


  private { Private declarations }
   sSql : String;

  public { Public declarations }

  end;



var
  frmSuspendeBeneficio: TfrmSuspendeBeneficio;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, UAutorizacao,
   FProgresso, fAguarde, UBeneficio, UFuncoesUteis, UAdmPrev;



procedure TfrmSuspendeBeneficio.BitBtn1Click(Sender: TObject);
Var
 sDataFinal : String;
 iUltDiaMes : integer;
 sUltdiaMes : string;
begin
   inherited;

   if MsgDlg('Deseja realmente suspender TODOS os benefícios pendentes de recadastramento?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin

      try

         try

            Screen.Cursor        := crHourGlass;
            btnSuspende.Enabled  := False;
            bbtnSair.Enabled     := False;
            bbtnAjuda.Enabled    := False;


            qry.First;

            While Not qry.Eof do
             Begin
               If qry.FieldByName('FlgDataPrevista').AsInteger = 0
               Then sDataFinal := qry.FieldByName('DataFinal').AsString
               Else sDataFinal := qry.FieldByName('DataFinalPrevista').AsString;

              CriaLogOcorrencia(qry.FieldByName('IDPLANOPREV').AsString,
                                qry.FieldByName('IDPESSJUR').AsString,
                                qry.FieldByName('IDTITULAR').AsString,
                                qry.FieldByName('IDBENEFICIO').AsString,
                                
                                qry.FieldByName('NUMEROPROCESSO').AsString,
                                qry.FieldByName('IDPESSOA').AsString,
                                qry.FieldByName('SEQPROPOSTA').AsString,
                                '3',   
                                DateToStr(date),
                                qry.FieldByName('VALORATUAL').AsString,
                                qry.FieldByName('VALORTOTAL').AsString,
                                qry.FieldByName('VALORCOTAS').AsString,
                                qry.FieldByName('DATAINICIO').AsString,
                                sDataFinal,
                                qry.FieldByName('VALORATUAL').AsString,
                                qry.FieldByName('DATAINICIO').AsString,
                                sDataFinal,
                                qry.FieldByName('IDSITBENEFICIO').AsString,
                                0,
                                qryAux,
                                '2',
                                -1,
                                iIdCalculoGeral
                                );

              
              StartTransacao;

              if (qry.FieldByName('ULTMESPREPARO').AsString <> '') and
                 (qry.FieldByName('ULTMESPREPARO').AsString <> '0000/00')
              then begin
                 iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(qry.FieldByName('ULTMESPREPARO').AsString,6,2)),
                                              StrToInt(Copy(qry.FieldByName('ULTMESPREPARO').AsString,1,4)) );

                 if iUltDiaMes <= 9
                 then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
                 else sUltDiaMes := IntToStr(iUltDiaMes);

                 sUltDiaMes := sUltDiaMes+'/'+Copy(qry.FieldByName('ULTMESPREPARO').AsString,6,2)+'/'+Copy(qry.FieldByName('ULTMESPREPARO').AsString,1,4);
              end
              else begin
                 iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(DateToStr(date),4,2)),
                                              StrToInt(Copy(DateToStr(date),7,4)) );

                 if iUltDiaMes <= 9
                 then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
                 else sUltDiaMes := IntToStr(iUltDiaMes);

                 sUltDiaMes := sUltDiaMes+'/'+Copy(DateToStr(date),4,2)+'/'+Copy(DateToStr(date),7,4);
              end;

              qryAtualiza.Close;
              qryAtualiza.ParamByName('DATAATUAL').asDateTime      := Date;
              qryAtualiza.ParamByName('DATARETENCAO').asDateTime   := StrToDate(sUltDiaMes);
              qryAtualiza.ParamByName('IDPLANOPREV').AsInteger     := qry.FieldByName('IDPLANOPREV').AsInteger;
              qryAtualiza.ParamByName('IDPESSJUR').AsInteger       := qry.FieldByName('IDPESSJUR').AsInteger;
              qryAtualiza.ParamByName('IDTITULAR').AsInteger       := qry.FieldByName('IDTITULAR').AsInteger;
              qryAtualiza.ParamByName('IDBENEFICIO').AsInteger     := qry.FieldByName('IDBENEFICIO').AsInteger;
              qryAtualiza.ParamByName('NUMEROPROCESSO').AsInteger  := qry.FieldByName('NUMEROPROCESSO').AsInteger;
              qryAtualiza.ParamByName('IDPESSOA').AsInteger        := qry.FieldByName('IDPESSOA').AsInteger;
              qryAtualiza.ParamByName('SEQPROPOSTA').AsInteger     := qry.FieldByName('SEQPROPOSTA').AsInteger;
              qryAtualiza.ExecSQL;

              
              Try
                If Not Sistema.GravaLogOperacoes(Self.Caption) Then
                  raise exception.Create('Erro ao gravar Log.')
              Except
              End;

              CommitTransacao;
              

              qry.Next;
             End;

            

            frmProgresso.MostraFormProgresso('Suspendendo Benefícios...', False, False, False, 0, 0);

         except

            RollBackTransacao;
            Screen.Cursor := crDefault;
            Raise;

         end;

      finally

         

         frmProgresso.EscondeFormProgresso;

         qry.Close;
         
         qry.Open;

         if qry.isEmpty then begin
            btnSuspende.Enabled := False;
         end else begin
            btnSuspende.Enabled := True;
         end;

         Screen.Cursor        := crDefault;
         MsgDlg('Os Benefícios selecionados foram Suspensos!', 'Aviso', mtInformation, [mbOk], 0);

         btnSuspende.Enabled  := True;
         bbtnSair.Enabled     := True;
         bbtnAjuda.Enabled    := True;
      end;
   end;

   if Qry.IsEmpty then
      btnSuspende.Enabled := False
   else
       btnSuspende.Enabled := True;
end;



procedure TfrmSuspendeBeneficio.FormShow(Sender: TObject);
begin
   inherited;
   pnlTitulo.Caption := pnlTitulo.Caption + ' '+DateToStr(date);
   qryAtualiza.Close;
   qryAtualiza.Prepare;

   frmAguarde.Mostra('Selecionando Beneficios a Suspender');
   frmAguarde.Refresh;
   with qry do begin
      Close;
      Prepare;
      ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
      ParamByName('DATAATUAL').asDateTime := Date;
      Open;
   end;
   frmAguarde.Apaga;

   if qry.isEmpty then begin
      btnSuspende.Enabled := False;
   end else begin
      btnSuspende.Enabled := True;
   end;
   
   sSql := 'SELECT /*+ INDEX(ELEGPATRO PKELEGPATR) */ '+
           'BF.IDPLANOPREV, '+
           'BF.IDPESSJUR, '+
           'BF.IDTITULAR, '+
           'BF.IDBENEFICIO, '+
           'BF.NUMEROPROCESSO , '+
           'BF.IDPESSOA, '+
           'BF.SEQPROPOSTA, '+
           'BF.VALORATUAL, '+
           'BF.VALORTOTAL, '+
           'BF.VALORCOTAS, '+
           'BF.DATAINICIO, '+
           'BF.DATAFINAL, '+
           'BF.DATAFINALPREVISTA, '+
           'BF.FLGDATAPREVISTA, '+
           'BF.IDSITBENEFICIO, '+
           'E.MATRICULA, '+
           'P.NOME, '+
           'B.NOME AS BENEFICIO, '+
           'BF.DATALIMITERECAD, '+
           'BF.ULTMESPREPARO '+  
           'FROM BENEFICIO B, BENEFBFCIARIO BF, ELEGPATRO E, PESSOA P, PARTPREVPLAN PP '+
           'WHERE '+
           '    (BF.IDBENEFICIO = B.IDBENEFICIO) '+
           'AND  E.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'+ 
           'AND (BF.IDSITBENEFICIO = 1) '+
           'AND (BF.FLGSTATUS = ''P'') '+
           'AND (BF.DATALIMITERECAD <= :DATAATUAL) '+
           'AND (BF.IDPESSJUR = E.IDPESSJUR) '+
           'AND (BF.IDTITULAR = E.IDPESSOA) '+
           'AND (BF.IDPESSOA = P.IDPESSOA) '+
           'AND (E.IDPESSOA = PP.IDPESSOA) '+
           'AND (E.IDPESSJUR = PP.IDPESSJUR) '+
           'AND (PP.FLGDESATIVADO = 0) ';

   cbOpcao.ItemIndex := 0;

   qryBenef.Close;
   qryBenef.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
   qryBenef.Open;
   //
end;



procedure TfrmSuspendeBeneficio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qry.Unprepare;
end;



procedure TfrmSuspendeBeneficio.DBgrdBeneficioDblClick(Sender: TObject);
begin
  inherited;
  if (MsgDlg('Suspender beneficio ?', 'Suspensão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
       with qry do begin
            Edit;
            FieldbyName('IDSITBENEFICIO').AsInteger     := 2;
            FieldbyName('FLGDATAPREVISTA').AsInteger    := 1;
            FieldbyName('DATAFINALPREVISTA').AsDateTime := dbDataLimite.Date;
            AplicaAlteracoes([Qry]);
            Close;
            Open;
       end;
  end;
end;


procedure TfrmSuspendeBeneficio.bbtnProcurarClick(Sender: TObject);
Var
 iIdBeneficio, sNovaSql : String;

begin
  inherited;

  sNovaSql:=' ';

  If (Trim(dblkBeneficio.Text) <> '') Or (Trim(edtNrInscricao.Text) <> '') Or
     (Trim(edtMatricula.Text) <> '')  Or (Trim(EdtNome.Text) <> '')        Or
     (Trim(dbDataLimite.Text) <> '')
   Then Begin
     If Trim(dblkBeneficio.Text) <> ''
      Then sNovaSql:= sNovaSql + 'AND (BF.IDBENEFICIO = '+ dblkBeneficio.LookupValue + ') ';

     If Trim(edtNrInscricao.Text) <> ''
      Then sNovaSql:= sNovaSql + 'AND (PP.INSCRICAONUMERO = '+ edtNrInscricao.Text+ ') ';

     If Trim(edtMatricula.Text) <> ''
      Then sNovaSql:= sNovaSql + 'AND (E.MATRICULA = '+ QuotedStr(edtMatricula.Text)+ ') ';

     If Trim(EdtNome.Text) <> ''
      Then
       Case cbOpcao.ItemIndex Of
        // Começa com
        0 : sNovaSql:= sNovaSql + 'AND (P.NOME LIKE '+QuotedStr(edtNome.Text+'%')+') ';
        // Termina com
        1 : sNovaSql:= sNovaSql + 'AND (P.NOME LIKE '+QuotedStr('%'+edtNome.Text)+') ';
        // Igual a
        2 : sNovaSql:= sNovaSql + 'AND (P.NOME =  '+QuotedStr(edtNome.Text)+') ';
        // Possui o texto
        3 : sNovaSql:= sNovaSql + 'AND (P.NOME LIKE '+QuotedStr('%'+edtNome.Text+'%')+') ';
       End;

     sNovaSql := sNovaSql +' ORDER BY P.NOME, BENEFICIO';

     frmAguarde.Mostra('Selecionando Beneficios a Suspender com filtros');

     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(sSql+sNovaSql);

     If Trim(dbDataLimite.Text) <> ''
      Then qry.ParamByName('DATAATUAL').asDateTime := dbDataLimite.Date
      Else qry.ParamByName('DATAATUAL').asDateTime := Date;

     qry.Open;

     btnSuspende.Enabled := Not qry.IsEmpty;

     frmAguarde.Apaga;

   End;
end;

end.

