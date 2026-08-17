// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Gleyber
//  Rotina     : FormCreate e FormClose
//  Data       : 19/05/2006
//  Pendencia  : -----
//  Alteração  : Implementação para criar o datamodule DtmRelatBeneficios e
//               destrui-lo quando fechar o form.
// -----------------------------------------------------------------------------
unit FConsPartINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, FPreview, Pptypes;

type
  TFrmConsPartINSS = class(TfrmSairAjuda)
    Panel1: TPanel;
    bbtnProcurar: TBitBtn;
    lblParticipante: TStaticText;
    Label1: TLabel;
    wwDBGrid1: TwwDBGrid;
    qry: TwwQuery;
    ds: TwwDataSource;
    MontaSelect1: TMontaSelect;
    Panel2: TPanel;
    edTotINSS: TEdit;
    edTotMant: TEdit;
    edTotDif: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnImprimir: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblMant: TStaticText;
    Label8: TLabel;
    lblOrgaoMant: TStaticText;
    edtMatricula: TEdit;
    qryAux: TwwQuery;
    edtnumBenef: TEdit;
    Label9: TLabel;
    lblEspecie: TStaticText;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    sIdPessoa     : String;
    Procedure Acumula;
  public
    { Public declarations }
  end;

var
  FrmConsPartINSS: TFrmConsPartINSS;

implementation

uses DRelatBeneficios;

{$R *.DFM}

procedure TFrmConsPartINSS.Acumula;
Var
  dTotINSS,
  dTotMant: Double;
begin
  dTotINSS := 0;
  dTotMant := 0;

  qry.First;
  While Not qry.Eof Do
  Begin
    dTotINSS := dTotINSS + qry.FieldByName('VALORINSS').AsFloat;
    dTotMant := dTotMant + qry.FieldByName('VALORMANT').AsFloat;
    qry.Next;
  End;
  edTotINSS.Text :=FormatFloat('R$#,##0.00',dTotINSS);
  edTotMant.Text :=FormatFloat('R$#,##0.00',dTotMant);
  edTotDif.Text :=FormatFloat('R$#,##0.00',dTotMant - dTotINSS);

  If (dTotMant - dTotINSS) < 0 Then
    EdTotDif.Font.Color := clRed
  Else EdTotDif.Font.Color := clBlack;

end;

procedure TFrmConsPartINSS.bbtnProcurarClick(Sender: TObject);
Var
  bAchou        : Boolean;
begin
  inherited;
  bAchou := False;

  // MATRICULA PREENCHIDA
  If Trim(edtMatricula.Text) <> '' Then
  Begin
    With qryAux Do
    Begin
      // Se a pessoa estiver na elegpatro E possuir um benefício do inss na benefbfciario,
      // então preenche as vairáveis e termina a procura.
      // FUNDAÇÃO /////
      Sql.Clear;
      Sql.Add(' SELECT E.IDPESSOA  ' +
              ' FROM ELEGPATRO E, BENEFBFCIARIO BF ' +
              ' WHERE E.MATRICULA LIKE ''' + Trim(EdtMatricula.Text)+ '%''' +
              '   AND BF.IDPESSOA = E.IDPESSOA ' +
              '   AND BF.NUMPROCINSS IS NOT NULL ');
      Open;
      If Not IsEmpty Then
      Begin
        // atribuições
        sIdPessoa     := FieldByName('IDPESSOA').AsString;
        bAchou := True;
      End Else
      Begin
        // MANTENEDORA /////
        Sql.Clear;
        Sql.Add(' SELECT BPP.IDBENEFICIARIOPP AS IDPESSOA ' +
                ' FROM BENEFICIARIOPP BPP, BENEFBFPP B ' +
                ' WHERE BPP.MATRICULA LIKE ''' + Trim(EdtMatricula.Text)+ '%''' +
                '   AND B.IDBENEFICIARIOPP = BPP.IDBENEFICIARIOPP ');
        Open;
        If Not IsEmpty Then
        Begin
          // atribuições
          sIdPessoa     := FieldByName('IDPESSOA').AsString;
          bAchou := True;
        End Else
        Begin
          Sql.Clear;
          Sql.Add(' SELECT DISTINCT E.IDPESSOA  ' +
                  ' FROM DEPENTIT E, BENEFBFCIARIO BF ' +
                  ' WHERE E.MATRICULA LIKE ''' + Trim(EdtMatricula.Text)+ '%''' +
                  '   AND BF.IDPESSOA = E.IDPESSOA ' +
                  '   AND BF.NUMPROCINSS IS NOT NULL ');
          Open;
          If Not IsEmpty Then
          Begin
            // atribuições
            sIdPessoa     := FieldByName('IDPESSOA').AsString;
            bAchou := True;
          End;
        End;
      End;
    End;

  // NUMERO BENEFÍCIO PREENCHIDO
  End Else If Trim(edtNumBenef.Text) <> '' Then
  Begin
    With qryAux Do
    Begin
      // Se a pessoa estiver na elegpatro E possuir um benefício do inss na benefbfciario,
      // então preenche as vairáveis e termina a procura.
      // FUNDAÇÃO /////
      Sql.Clear;
      Sql.Add(' SELECT IDPESSOA ' +
              ' FROM BENEFBFCIARIO  ' +
              ' WHERE NUMPROCINSS LIKE ''' + trim(edtNumBenef.Text) + '%''' );
      Open;
      If Not IsEmpty Then
      Begin
        // atribuições
        sIdPessoa     := FieldByName('IDPESSOA').AsString;
        bAchou := True;
      End Else
      Begin
        // MANTENEDORA /////
        Sql.Clear;
        Sql.Add(' SELECT IDBENEFICIARIOPP AS IDPESSOA ' +
                ' FROM BENEFBFPP BF ' +
                ' WHERE BF.NUMPROCINSS LIKE ''' + trim(edtNumBenef.Text) + '%''' );
        Open;
        If Not IsEmpty Then
        Begin
          // atribuições
          sIdPessoa     := FieldByName('IDPESSOA').AsString;
          bAchou := True;
        End;
      End;
    End;
  End Else
  Begin
    MontaSelect1.Executar;
    If MontaSelect1.RetornouValor Then
    Begin
      sIdPessoa := MontaSelect1.valoresChave[0];
      bAchou := True;
    End;

  End;

  If bAchou Then
  Begin
    // abrir a DETCONCINSS
    qry.Close;
    qry.Params[0].AsInteger := StrToint(sIdPessoa);
    qry.Open;
    If Not qry.IsEmpty Then
    Begin
      lblMant.Caption := qry.FieldByName('MANT').AsString;
      lblParticipante.Caption := qry.FieldByName('NOME').AsString;
      edtMatricula.Text := qry.FieldByName('MATRICULA').AsString;
      edtnumBenef.Text := qry.FieldByName('NUMPROCINSS').AsString;
      lblOrgaoMant.Caption := qry.FieldByname('CODMANTENEDORINSS').AsString;
      lblEspecie.Caption := qry.FieldByName('NOMEBENEF').AsString;
      Acumula;
    End Else
    Begin
      lblMant.Caption := '';
      lblParticipante.Caption := '';
      edtMatricula.Text := '';
      edtnumBenef.Text := '';
      lblOrgaoMant.Caption := '';
      lblEspecie.Caption := '';
      qry.Close;
    End
  End;
  btnImprimir.Enabled := bAchou;
end;

procedure TFrmConsPartINSS.btnImprimirClick(Sender: TObject);
begin
  inherited;
   //

  With DtmRelatBeneficios Do
  Begin
    qryConsPartINSS.sql.Clear;
    qryConsPartINSS.sql.Assign(qry.SQL);
    qryConsPartINSS.Params[0].AsString := sIdPessoa;

    lblMatricula.Caption := qry.FieldByName('MATRICULA').AsString;
    lblParticipante.Caption := qry.FieldByName('NOME').AsString;
    lblNumBenef.Caption := qry.FieldByName('NUMPROCINSS').AsString;
    lblMant.Caption := qry.FieldByName('MANT').AsString;
    lblOrgaoMant.Caption := qry.FieldByname('CODMANTENEDORINSS').AsString;

      lblEspecie.Caption := qry.FieldByName('NOMEBENEF').AsString;


    ppDsgnINSS.Report.Template.SaveTo   := stFile;
    ppDsgnINSS.Report.Template.Format   := ftASCII;
    ppDsgnINSS.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, ppDsgnINSS.Report, 'Reembolso INSS - Extrato Individual');
  End;

end;

procedure TFrmConsPartINSS.FormCreate(Sender: TObject);
begin
  inherited;

  try
    Application.CreateForm(TdtmRelatBeneficios, dtmRelatBeneficios);
  except
    MessageDlg(
      'Erro ao criar datamodule "TdtmRelatBeneficios".'+#13+#10+
      'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
  end;
end;

procedure TFrmConsPartINSS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmRelatBeneficios.Free; 
end;



end.