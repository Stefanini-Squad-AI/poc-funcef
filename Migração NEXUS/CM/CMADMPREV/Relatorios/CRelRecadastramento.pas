// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 04.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit CRelRecadastramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar,  IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdblook, Db, DBTables, Wwquery,
  StdCtrls, ExtCtrls;

type
  TcfgRelRecadastramento = class(TfrmOkCancelar)
    chkSeparador: TCheckBox;
    rdgBeneficios: TRadioGroup;
    rdgOrdena: TRadioGroup;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    qryTipoDoc: TwwQuery;
    qryTipoDocNOMEDOCUMENTO: TStringField;
    qryTipoDocIDDOCUMENTO: TFloatField;
    DBcboDocumento: TwwDBLookupCombo;

    // procedimentos definidos
    function VerificaPreenchimento: boolean;
    procedure FiltraRelatorio;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }

  public { Public declarations }

  end;



var
  cfgRelRecadastramento: TcfgRelRecadastramento;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, uVerificaPreenchimento,
   DRelatAdmPrev, UAdmPrev;


function TcfgRelRecadastramento.VerificaPreenchimento: boolean;
begin
    Result := False;

    try
       if ( (DBcboDocumento.LookupValue = '') or (length(trim(DBcboDocumento.Text)) = 0) )
       then raise EValidacao.CreateVal('É necessário selecionar o tipo de Documento referente à Carteira de Identidade!', DBcboDocumento);

    except
       on ev : EValidacao do
       begin
          Screen.Cursor := crDefault;
          if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
          Repaint;
          ev.Control.SetFocus;
          Exit;
       end;
    end;
    Result := True;
end;



procedure TcfgRelRecadastramento.FiltraRelatorio;
begin
   //  OBTER DADOS DA FUNDAÇÃO
   dtmRelatAdmPrev.qryFundacao.Close;
   dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger;
   dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
   dtmRelatAdmPrev.qryFundacao.Prepare;
   dtmRelatAdmPrev.qryFundacao.Open;

   with dtmRelatAdmPrev.qryRecadastramento do begin

      Close;
      SQL.Clear;
      SQL.Add('SELECT ' +
      '  BF.NUMPROCINSS, ' +
      '  BF.NUMCARTARECAD, BF.DATAEMISSAORECAD, BF.DATALIMITERECAD, ' +
      '  BF.DATARECEBRECAD, BF.FLGSTATUS, BF.BANCOINSS, ' +
      '  BF.MESRECIBOINSS, BF.ANORECIBOINSS, ' +
      '  B.NOME AS BENEFICIO, ' +
      '  P.NOME, P.NUMDOCUMENTO AS CPF, ' +
      '  E.MATRICULA, BF.IDPESSOA ' +
      'FROM ' +
      '  PATRO PT, BENEFBFCIARIO BF, BENEFICIO B, ELEGPATRO E, PESSOA P ' + 
      'WHERE ' +
      '  ( BF.IDSITBENEFICIO = 1 ) AND          ' +
      '  ( BF.IDBENEFICIO = B.IDBENEFICIO ) AND ' +
      '  ( BF.IDTITULAR = E.IDPESSOA ) AND      ' +
      '  ( BF.IDPESSOA = P.IDPESSOA ) AND       ' +
      '  ( PT.IDPESSOA = BF.IDPESSJUR ) AND     ' +
      '  ( PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

     //  Colocação do Alias
     // Substituído BF.FLGSTATUS = NULL por BF.FLGSTATUS IS NULL.
      case rdgBeneficios.ItemIndex of
         0: SQL.Add(' AND ( BF.FLGSTATUS = ''P'' ) ');
         1: SQL.Add(' AND ( BF.FLGSTATUS IS NULL ) ');
      end;

      case rdgOrdena.ItemIndex of
         0: SQL.Add(' ORDER BY E.MATRICULA, P.NOME, BENEFICIO ');
         1: SQL.Add(' ORDER BY P.NOME, BENEFICIO, E.MATRICULA ');
      end;

      Open;
   end;
end;



procedure TcfgRelRecadastramento.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if VerificaPreenchimento then begin
      FiltraRelatorio;

      with dtmRelatAdmPrev do begin
         bSeparador := chkSeparador.Checked;
      end;
   end;
end;



procedure TcfgRelRecadastramento.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoDoc.Open;
end;



procedure TcfgRelRecadastramento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoDoc.Close;
end;



end.

